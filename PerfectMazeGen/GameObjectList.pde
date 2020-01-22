class GameObjectList extends GameObject {
  protected ArrayList<GameObject> children;

  public GameObjectList() {
    children = new ArrayList<GameObject>();
  }

  public ArrayList<GameObject> Children() {
    return children;
  }

  public void Add(GameObject obj) {
    obj.Parent = this;
    children.add(obj);
  }

  public void Update() {
    super.Update();
    for (GameObject obj : children) {
      obj.Update();
      PVector desiredPosition = new PVector(0, 0);
      desiredPosition.add(obj.Parent.position);
      desiredPosition.add(obj.position);
      obj.drawPosition = desiredPosition;
    }
  }

  public void draw() {
    for (GameObject obj : children) {
      obj.draw();
    }
  }
}
