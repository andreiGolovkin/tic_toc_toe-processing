class gameState{
  int player = 1;
  boolean draw = false;
  int winner = 0;
  int[][] state;
  
  gameState(){
    state = new int[3][3];
    
    for(int row = 0; row < state.length; row++){
      for(int col = 0; col < state[row].length; col++){
        state[col][row] = 0;
      }
    }
  }
  
  gameState(int[][] state){
    this.state = new int[3][3];
    
    for(int row = 0; row < state.length; row++){
      for(int col = 0; col < state[row].length; col++){
        this.state[col][row] = state[col][row];
      }
    }
  }
  
  gameState copy(){
    gameState ans = new gameState(this.state);
    ans.player = this.player;
    ans.winner = this.winner;
    return ans;
  }
  
  boolean validTurn(int col, int row){
    return state[col][row] == 0;
  }
  
  void turn(int col, int row){
    if(validTurn(col, row)){
      state[col][row] = player;
      player = (player % 2) + 1;
    }
    
    for(int n = 0; n < state.length; n++){
      if(state[n][0] != 0 && state[n][0] == state[n][1] && state[n][0] == state[n][2]){
        winner = state[n][0];
        break;
      }
      else if(state[0][n] != 0 && state[0][n] == state[1][n] && state[0][n] == state[2][n]){
        winner = state[0][n];
        break;
      }
    }
    
    if(!isFinished()){
      if((state[0][0] != 0 && state[0][0] == state[1][1] && state[0][0] == state[2][2]) || (state[0][2] != 0 && state[0][2] == state[1][1] && state[0][2] == state[2][0])){
        winner = state[1][1];
      }
    }
    
    if(!isFinished()){
      this.draw = true;
      for(int r = 0; r < this.state.length; r++){
        for(int c = 0; c < this.state[r].length; c++){
          if(state[r][c] == 0){
            this.draw = false;
            break;
          }
        }
      }
    }
  }
  
  boolean isFinished(){
    return winner != 0 || draw;
  }
  
  boolean equal(gameState other){
    boolean ans = true;
    
    for(int row = 0; row < this.state.length; row++){
      for(int col = 0; col < this.state[row].length; col++){
        if(this.state[row][col] != other.state[row][col]){
          ans = false;
          break;
        }
      }
    }
    return ans;
  }
  
  @Override
  String toString(){
    String ans = "++++++++++++++++++++++++\n";
    
    for(int row = 0; row < state.length; row++){
      for(int col = 0; col < state[row].length; col++){
        if(state[col][row] == 0) ans += "_";
        else if(state[col][row] == 1) ans += "X";
        else if(state[col][row] == 2) ans += "O";
      }
      ans += "\n";
    }
    
    return ans;
  }
}
