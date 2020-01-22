class RecursiveMaze extends Grid {
  PVector currentCell; 

  ArrayList<Cell> stack = new ArrayList<Cell>();
  HashMap<String, PVector> unVisitedN = new HashMap<String, PVector>(); // Unvisited neighbors

  public RecursiveMaze(PVector size) {
    super(size);

    currentCell = new PVector(1, 1);

    cells[(int)currentCell.x][(int)currentCell.y].start = true;
    cells[(int)currentCell.x][(int)currentCell.y].visited = true;
    cells[(int)size.x - 2][(int)size.y - 2].finishLine = true;
  }

  public boolean hasUnvisitedN(Cell c) {
    unVisitedN.clear();

    // Check Top
    if (currentCell.y - 1 > - 1 && !cells[(int)currentCell.x][(int)currentCell.y - 1].visited) {
      unVisitedN.put("top", new PVector(currentCell.x, currentCell.y - 1));
    }

    // Check Bottom
    if (currentCell.y + 1 < size.x && !cells[(int)currentCell.x][(int)currentCell.y + 1].visited) {
      unVisitedN.put("bottom", new PVector(currentCell.x, currentCell.y + 1));
    }

    // Check Right
    if (currentCell.x + 1 < size.y && !cells[(int)currentCell.x + 1][(int)currentCell.y].visited) {
      unVisitedN.put("right", new PVector(currentCell.x + 1, currentCell.y));
    }

    // Check left
    if (currentCell.x - 1 > 0 && !cells[(int)currentCell.x - 1][(int)currentCell.y].visited) {
      unVisitedN.put("left", new PVector(currentCell.x - 1, currentCell.y));
    }

    return !unVisitedN.isEmpty();
  }

  public String GetKey(int i) {
    String randomKey = null;
    int index = 0;

    for (String _key : unVisitedN.keySet()) {
      if (index == i) {
        randomKey = _key;
        break;
      }

      index++;
    }

    return randomKey;
  }

  public void RemoveWall(PVector current, PVector neighbor) {
    if (current.x - neighbor.x < 0) {
      // NeighBor zit rechts van current
      cells[(int)current.x][(int)current.y].RemoveWall("right");
      cells[(int)neighbor.x][(int)neighbor.y].RemoveWall("left");
    } else if (current.x - neighbor.x > 0) {
      // Neighbor zit links van current
      cells[(int)current.x][(int)current.y].RemoveWall("left");
      cells[(int)neighbor.x][(int)neighbor.y].RemoveWall("right");
    }

    if (current.y - neighbor.y < 0) {
      // Neighbor zit onder current
      cells[(int)current.x][(int)current.y].RemoveWall("bottom");
      cells[(int)neighbor.x][(int)neighbor.y].RemoveWall("top");
    } else if (current.y - neighbor.y > 0) {
      // Neighbor zit Boven current
      cells[(int)current.x][(int)current.y].RemoveWall("top");
      cells[(int)neighbor.x][(int)neighbor.y].RemoveWall("bottom");
    }
  }

  public void Update() {
    cells[(int)currentCell.x][(int)currentCell.y].selected = false;
    
    // If the curretn cell has any unvisited neighbors
    if (hasUnvisitedN(cells[(int)currentCell.x][(int)currentCell.y])) {
      // Choose randomly one of the neighbours
      String _key = GetKey((int)random(0, unVisitedN.keySet().size()));
      PVector selectedNeighbor = unVisitedN.get(_key);

      // Push the current cell to the stack if it has more then one unvisitted neighbors
      if (unVisitedN.size() > 1) {
        stack.add(cells[(int)currentCell.x][(int)currentCell.y]);
      }

      // Remove the wall between the current cell and the selected neighbor
      RemoveWall(currentCell, selectedNeighbor);

      // Make the neighbor cell the current cell
      currentCell = selectedNeighbor;
      cells[(int)currentCell.x][(int)currentCell.y].visited = true;
    } else if (!stack.isEmpty()){
      // pop a cell from the stack while the stack is not empty and make it the current cell
       currentCell = stack.get(stack.size() - 1).index;
       stack.remove(stack.size() - 1);
    }
    
    cells[(int)currentCell.x][(int)currentCell.y].selected = true;
  }
}
