//int[][] s =  {{1, 0, 2},
//              {0, 2, 0},
//              {2, 1, 0}};
gameState g = new gameState();

player[] p = new player[2];

tree decisionTree;

void setup(){
  size(750, 750);
  
  decisionTree = new tree();
  
  p[1] = new player(new ai(decisionTree, 2), 2);
  //p[1] = new player(2);
  //p[0] = new player(new ai(decisionTree, 1), 1);
  p[0] = new player(1);
  
  textSize(63);
  textAlign(CENTER, CENTER);
}

void draw(){
  background(0);
  
  drawField(g);
  //println(g);
  
  
  if(!g.isFinished() && p[g.player - 1].toString().equals("c")){
    int[] turn = p[g.player - 1].intel.turn();
    int pl = g.player - 1;
    g.turn(turn[0], turn[1]);
    if(p[0].toString().equals("c")){
      p[0].intel.move(g);
    }
    if(p[1].toString().equals("c")){
      p[1].intel.move(g);
    }
  }
  
  if(g.isFinished()){
    fill(0, 255, 0);
    text(g.winner == 0 ? ("Draw!") : ("Player " + g.winner + " won"), width / 2, height / 2);
  }
  
  //println(p[g.player - 1]);
}

void drawField(gameState g){
  float w = width / 3;
  float h = height / 3;
  
  stroke(255);
  strokeWeight(10);
  noFill();
  line(w, 0, w, height);
  line(2*w, 0, 2*w, height);
  line(0, h, width, h);
  line(0, 2*h, width, 2*h);
  
  for(int row = 0; row < g.state.length; row++){
    for(int col = 0; col < g.state[row].length; col++){
      if(g.state[col][row] == 1){
        line((col * w) + 20, (row * h) + 20, ((col + 1) * w) - 20, ((row + 1) * h) - 20);
        line((col * w) + 20, ((row + 1) * h) - 20, ((col + 1) * w) - 20, (row * h) + 20);
      }
      else if(g.state[col][row] == 2){
        ellipse(((float)col + 0.5) * w, ((float)row + 0.5) * h, 200, 200);
      }
    }
  }
}

void mousePressed(){
  if(!g.isFinished() && p[g.player - 1].toString().equals("p")){
    int w = width / 3;
    int h = height / 3;
  
    int col, row;
    for(col = 0; col <= 2 && (col + 1) * w < mouseX; col++);
    for(row = 0; row <= 2 && (row + 1) * h < mouseY; row++);
    g.turn(col, row);
    
    if(p[g.player - 1].toString().equals("c")) p[g.player - 1].intel.move(g);
  }
}
