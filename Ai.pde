class ai{
  node pos;
  int p;
  
  ai(tree dec, int p){
    this.pos = dec.root;
    this.p = p;
  }
  
  int[] turn(){
    int[] ans = new int[2];
    
    float effD = -1;
    int indexD = -1;
    float effW = -1;
    int indexW = -1;
    for(int n = 0; n < pos.next.size(); n++){
      float realChanceOfWinning = pos.next.get(n).chanceOfWinning(p);
      for(node d : pos.next.get(n).next){
        if(d.chanceOfWinning(p) == 0.0) realChanceOfWinning = 0.0;
      }
      
      if(effD < pos.next.get(n).chanceOfDraw()){
        effD = pos.next.get(n).chanceOfDraw();
        indexD = n;
      }
      
      if(effW < realChanceOfWinning){
        effW = realChanceOfWinning;
        indexW = n;
      }
    }
    
    if(effW == 0){
      ans = pos.turn.get(indexD);
    }
    else{
      ans = pos.turn.get(indexW);
    }
    
    return ans;
  }
  
  void move(gameState g){
    println("try to find...");
    println(g);
    for(node n : pos.next){
      if(n.data.equal(g)){
        println("found");
        println(n.data);
        pos = n;
        println("next posible possitions");
        for(node d : pos.next){
          println(d.data);
          println("Chance of winning: " + d.chanceOfWinning(p));
          println("Chance of draw: " + d.chanceOfDraw());
        }
        break;
      }
    }
  }
}
