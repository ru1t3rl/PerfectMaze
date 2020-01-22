class GameObject {
  PVector velocity, position, drawPosition;
  boolean visible = true;
  String id = "Null";
  GameObject Parent;
  protected float deltaTime = 0;


  public GameObject() {
    Setup(new PVector(0, 0), new PVector(0, 0));
  }

  public GameObject(PVector position) {
    Setup(position, new PVector(0, 0));
  }

  public GameObject(PVector position, PVector velocity) {
    Setup(position, velocity);
  }

  protected void Setup(PVector position, PVector velocity) {
    this.position = position; 
    this.velocity = velocity;
  }

  public void Update() {
    deltaTime = frameRate*1.0 / FPS;
    PVector newVelocity = velocity;
    position.add(newVelocity.mult(deltaTime));
  }

  public void draw() {
    
  }
}
