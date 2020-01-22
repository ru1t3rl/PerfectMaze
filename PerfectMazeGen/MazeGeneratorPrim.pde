class PrimGenerator extends Grid {
  ArrayList<Wall> walls;
  PVector selectedCell, neighbourCell;
  int selectedWall;
  int cellsVisited = 0;
  String wantedWall, wallType;
  boolean finished, starting;

  public PrimGenerator(PVector size) {
    super(size);

    walls = new ArrayList<Wall>();
    selectedCell = new PVector(0, 0);
    neighbourCell = new PVector(0, 0);
    selectedWall = 0;
    wantedWall = null;
    starting = true;
    
    cells[(int)size.x - 2][(int)size.y - 2].finishLine = true;
  }

  public void AddWalls(Cell c) {
    for (String _key : c.walls.keySet()) {
      walls.add(c.walls.get(_key));
    }
  }

  public void Update() {
    if (walls.size() <= 0 && starting ) {
      selectedCell.x = 1;//random(0, cells.length);
      selectedCell.y = 1; //random(0, cells[(int)selectedCell.x].length);
      cells[(int)selectedCell.x][(int)selectedCell.y].start = true;

      println("Adding first Walls");
      AddWalls(cells[(int)selectedCell.x][(int)selectedCell.y]);
      
      starting = false;
    }

    if (walls.size() > 0 && !finished) {
      cells[(int)selectedCell.x][(int)selectedCell.y].selected = false;
      
      selectedWall = (int)random(0, walls.size());
      selectedCell.x = walls.get(selectedWall).index.x;
      selectedCell.y = walls.get(selectedWall).index.y;
      
      cells[(int)selectedCell.x][(int)selectedCell.y].selected = true;

      switch(walls.get(selectedWall).position) {
      case "top":
        neighbourCell = new PVector(selectedCell.x, selectedCell.y - 1);
        wantedWall = "bottom";
        break;
      case "bottom":
        neighbourCell = new PVector(selectedCell.x, selectedCell.y + 1);
        wantedWall = "top";
        break;
      case "left":
        neighbourCell = new PVector(selectedCell.x - 1, selectedCell.y);
        wantedWall = "right";
        break;
      case "right":
        neighbourCell = new PVector(selectedCell.x + 1, selectedCell.y);
        wantedWall = "left";
        break;  
      default:
        println("Not a valid Wall");
        break;
      }

      // Check if one of them has ever been visited
      try {
        if (!cells[(int)neighbourCell.x][(int)neighbourCell.y].visited) {
          // Make the pasage
          cells[(int)selectedCell.x][(int)selectedCell.y].RemoveWall(walls.get(selectedWall).position);
          cells[(int)neighbourCell.x][(int)neighbourCell.y].RemoveWall(wantedWall);

          cells[(int)neighbourCell.x][(int)neighbourCell.y].visited = true;

          // Add the neighbouring walls of the cell to the wall list
          AddWalls(cells[(int)neighbourCell.x][(int)neighbourCell.y]);
        }

        walls.remove(selectedWall);
      } catch (ArrayIndexOutOfBoundsException ex){
          println("Finished");
          
          finished = true;
      }
    }
  }
}
