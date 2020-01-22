class PlayingState extends GameObjectList{
  RecursiveMaze RecursiveMaze;
  PrimGenerator PrimMaze;
  
  public PlayingState(){
    this.Add(RecursiveMaze = new RecursiveMaze(new PVector(max,max)));
    //this.Add(PrimMaze = new PrimGenerator(new PVector(max, max)));
  }
  
  public void Update(){
     super.Update();
  }
}
