//still call the cell in a 2d array
//class of cellsize 
//each cellsize contains position, color(random), boolean
Cells c;
ArrayList <Cells> myCells;


final int COLS = 25;
final int ROWS = 25;


PVector[][] positions = new PVector[COLS][ROWS];

int cellSize;

void setup(){

  size(600,600);
  background(255);
  noStroke();
  
  myCells = new ArrayList <Cells>();
  
  cellSize = width/COLS;
  
  for (int i = 0; i < COLS; i++){
    for(int j = 0; j < ROWS; j ++){
      positions[i][j] = new PVector(i* cellSize, j * cellSize);
      c = new Cells(i* cellSize, j * cellSize);
      c.isActive = false;
    }
  }
      
}


void draw(){
  for (int i = 0; i < COLS; i++) {
    for (int j = 0; j < ROWS; j++) {
      if (c.isActive) {
        rect(positions[i][j].x, positions[i][j].y, cellSize, cellSize);
        c.cellsColor();
        c.display();
      } else if (mouseX > positions[i][j].x && mouseX < positions[i][j].x + cellSize && 
          mouseY > positions[i][j].y && mouseY < positions[i][j].y + cellSize) {
          c.isActive = true;
          
  
      }
    }
  }

   println(c.isActive);
   print(c.x, c.y);
   print(mouseX, mouseY);
}

class Cells {
 float x, y;
 boolean isActive;
 
 Cells(float _x, float _y){
   x = _x;
   y = _y;

 } 
 
 void display(){
   rect(x, y, cellSize, cellSize);
 
 }
 
 void cellsColor(){
   if(isActive == true){
     fill(random(255), random(255),random(255));
   }
   
 }
 
 void mouseHover(){
   if (mouseX > x && mouseX < x + cellSize && mouseY > y && mouseY < y + cellSize) {
     isActive = true;
   } else {
     isActive = false;
   
   }
 
 }
 


}
