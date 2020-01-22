class Wall extends GameObject {
  PVector index, size;

  boolean visible;
  String position;

  public Wall(PVector index, PVector size, String position) {
    this.index = index;
    this.size = size;

    this.position = position;
    visible = true;
  }


  public void draw() {
    stroke(255);
    strokeWeight(2);

    if (visible) {
      switch(position.toLowerCase()) {
      case "top":
        line(index.x * size.x, index.y * size.y, index.x * size.x + size.x, index.y * size.y);
        break;
      case "bottom":
        line(index.x * size.x, index.y * size.y + size.y, index.x * size.x + size.x, index.y * size.y + size.y);
        break;
      case "left":
        line(index.x * size.x, index.y * size.y, index.x * size.x, index.y * size.y + size.y);
        break;
      case "right":
        line(index.x * size.x + size.x, index.y * size.y, index.x * size.x + size.x, index.y * size.y + size.y);
        break;
      }
    }
  }
}
