final int FPS = 7;
final PVector Window = new PVector(900, 900);
public boolean wallsGenerated = false;
public int max = 10;
PlayingState ps;

void settings() {

  println("Setting Window Size");

  //fullScreen(P3D);

  size(int(Window.x), int(Window.y), P3D);
}

void setup() {
  println("Setting Frame Rate");
  frameRate(FPS);
  
  println("Turning stroke off");
  //noStroke();
  
  println("\nEverything is setup! You're ready to rock");
  ps = new PlayingState();
}

void Update(){
  ps.Update();
}

void draw() {
  background(0);
  Update();
  ps.draw();
}

// 1-3-6-9 = 35
// 1-3-8-9 = 31
// 1-3-6-8-9 = 
// 1-3-5-6-9 = 32
// 1-3-4-8-9 = 34
