class Cell extends GameObject {
  PVector index, size;

  boolean visited, start, selected, isBorder, finishLine;
  HashMap<String, Wall> walls;

  public Cell(PVector index, PVector size) {
    this.index = index;
    this.size = size;

    start = false;
    selected = false;
    finishLine = false;

    walls = new HashMap<String, Wall>();
    GenerateWalls();
  }

  public void GenerateWalls() {
    for (int iWall = 0; iWall < 4; iWall++) {
      switch (iWall) {
      case 0:
        walls.put("top", new Wall(index, size, "top"));
        break;
      case 1:
        walls.put("bottom", new Wall(index, size, "bottom"));
        break;
      case 2:
        walls.put("left", new Wall(index, size, "left"));
        break;
      case 3:
        walls.put("right", new Wall(index, size, "right"));
        break;
      }
    }

    if (index.x <= 0 || index.x >= Window.x/size.x - 1 || index.y <= 0 || index.y >= Window.y / size.y - 1) {
      visited = true;
      isBorder = true;
    }
  }

  public Wall GetWall(String _key) {
    return  walls.get(_key);
  }

  public String GetKey(int index) {
    int i = 0; 
    String k = null;

    for (String _key : walls.keySet()) {
      if (i == index) {
        k = _key;
        break;
      }
      i++;
    }

    return k;
  }

  public void RemoveWall(String _key) {
    walls.remove(_key);
  }

  public void draw() {
    if (!isBorder) {    
      for (String _key : walls.keySet()) {
        walls.get(_key).draw();
      }
    }


    noStroke();  
    if (start) {
      fill(0, 255, 0);
    } else if (selected) {
      fill(255, 0, 0);
    } else if (finishLine){
      fill(255, 0, 255);
    } else if (visited) {
      fill(0);
    } else {
      fill(255);
    }
    rect(int(index.x * size.x), int(index.y * size.y), size.x, size.y);
  }
}
