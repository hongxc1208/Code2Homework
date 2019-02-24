//25 cirlces, array position, random color, random size
//position, color, size, 

final int COLS = 5;
final int ROWS = 5;


PVector[][] position = new PVector[COLS][ROWS];
color[][] c = new color[COLS][ROWS];
float[][] radius = new float[COLS][ROWS];
color[][] c2 = new color[COLS][ROWS];
void setup(){
  size(625,625);    
  float cSize = 125;
  
  for(int i = 0; i < COLS; i++){
    for(int j = 0; j < ROWS; j++){
      position[i][j]= new PVector(i *cSize, j* cSize);
      c[i][j]= color(0,random(255),random(255));
      radius[i][j] = (random(20,60));
      c2[i][j] = color(255, 0, 0);
      
    }
  }
}


void draw(){
  background(0);
  for(int i = 0; i < COLS; i++){
    for(int j = 0; j < ROWS; j++){
        fill(c[i][j]);
        ellipse(position[i][j].x+radius[i][j], position[i][j].y+radius[i][j], radius[i][j], radius[i][j]);
    }
  }

}
