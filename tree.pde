class tree{
  node root;
  
  tree(){
    root = new node(new gameState());
    
    /*for(node n : root.next){
      println(n.data);
      println(n.chanceOfWinning(1));
    }*/
  }
}

class node{
  gameState data;
  ArrayList<node> next;
  ArrayList<int[]> turn;
    
  float dm = 0, wm = 0, M = 0;
  private float winVar, drawVar;
    
  node(gameState data){
    next = new ArrayList<node>();
    turn = new ArrayList<int[]>();
    
    this.data = data;
    
    if(!data.isFinished()){
      for(int row = 0; row < data.state.length; row++){
        for(int col = 0; col < data.state[row].length; col++){
          if(data.validTurn(col, row)){
            gameState nd = data.copy();
            int[] t = new int[2];
            t[0] = col;
            t[1] = row;
            turn.add(t);
            nd.turn(col, row);
            node nn = new node(nd);
            dm += nn.dm;
            wm += nn.wm;
            M += nn.M;
            next.add(nn);
          }
        }
      }
    }
    else{
      wm = data.winner == 1 ? 1 : 0;
      dm = data.winner == 0 ? 1 : 0;
      M = 1;
    }
    
    winVar = wm / M;
    drawVar = dm / M;
  }
    
  float chanceOfWinning(int p){
    return p == 1 ? winVar : 1 - winVar;
  }
  
  float chanceOfDraw(){
    return drawVar;
  }
}
