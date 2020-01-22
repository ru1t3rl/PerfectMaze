class Square extends GameObject{
   PVector size, clr;
   int Origin = CENTER;
   
   public Square(PVector position, PVector velocity, PVector size, PVector clr){
     super(position, velocity);
     this.size = size;
     this.clr = clr; //The color of the object
   }
   
   public void Update(){
      super.Update();
   }
   
   public void draw(){
     super.draw();
     fill(clr.x, clr.y, clr.z);
     rectMode(Origin);
     rect(drawPosition.x, drawPosition.y, size.x, size.y); 
   }
}
