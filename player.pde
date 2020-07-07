class player{
  int player;
  ai intel;
  
  player(int player){
    this.intel    = null;
    this.player  = player;
  }
  
  player(ai intel, int player){
    this.intel    = intel;
    this.player  = player;
  }
  
  @Override
  String toString(){
    return this.intel == null ? "p" : "c";
  }
}
