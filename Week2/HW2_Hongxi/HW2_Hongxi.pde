
int COLS = 10;
int ROWS = 5;
int w = 400;
int h = 400;
int ball;
int CELLSIZEW = 80;
int CELLSIZEH = 20;

int radius= 15;
float xpos = 300;
float ypos = 200;
int xdirection = 1;
int ydirection = 1;
int xspeed = 6;
int yspeed = 4;





PVector [][] Bricks = new PVector[COLS][ROWS];
boolean [][] isActive = new boolean[COLS][ROWS];

void setup(){
  size(800, 800);

  for(int i = 0; i < COLS; i++){
    for (int j = 0; j < ROWS; j++){
      Bricks[i][j] = new PVector(i * CELLSIZEW, j * CELLSIZEH);
      isActive[i][j] = true;
      
    }
  }
  

}

void draw(){
  background(0);

  xpos = xpos + ( xspeed * xdirection);
  ypos = ypos + ( yspeed * ydirection);
  
   if(xpos > mouseX && xpos < mouseX +100 && ypos == 600 ){
      xdirection = xdirection *-1;
      ydirection = ydirection *-1;
  }
  
  for(int i= 0; i < COLS; i++){
    for(int j= 0; j< ROWS; j++){
      if(xpos > Bricks[i][j].x && xpos < Bricks[i][j].x + CELLSIZEW && 
      ypos > Bricks[i][j].y && ypos < Bricks[i][j].y +CELLSIZEH +radius){
        isActive[i][j] = false;
        ydirection = ydirection *-1;

      }
    if(isActive[i][j]){
      rect(Bricks[i][j].x, Bricks[i][j].y, CELLSIZEW, CELLSIZEH);
      }
      
    }
  }
  
  if (xpos > width - radius || xpos < radius){
      xdirection = xdirection *-1;
    }
  if(ypos > height - radius || ypos < radius){
      ydirection = ydirection *-1;
     }
     

  
  ellipse(xpos, ypos, radius*2, radius*2);
  
  rect(mouseX,600, 100, 20);

}
