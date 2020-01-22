class Grid extends GameObject {
  PVector size;
  Cell[][] cells;

  public Grid(PVector size) {
    this.size = size;
    cells = new Cell[(int)size.x][(int)size.y];

    GenerateGrid();
  }

  public void GenerateGrid() {
    for (int x = 0; x < size.x; x++) {
      for (int y = 0; y < size.y; y++) {
        cells[x][y] = (new Cell(new PVector(x, y), new PVector(width/size.x, height/size.y)));
      }
    }
  }

  public void draw() {
    for (int x = 0; x < size.x; x++) {
      for (int y = 0; y < size.y; y++) {
        cells[x][y].draw();
      }
    }
  }
}
