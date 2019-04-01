//still call the cell in a 2d array
//class of cellsize 
//each cellsize contains position, color(random), boolean
Cells c;
ArrayList <Cells> myCells;

final int COLS = 25;
final int ROWS = 25;
Cells[][] cells = new Cells[COLS][ROWS];

int cellSize;
void setup(){

  size(600,600);
  background(255);
  noStroke();
  cellSize = width/COLS;
  
  for (int i = 0; i < COLS; i++){
    for(int j = 0; j < ROWS; j ++){
      cells[i][j] = new Cells(i, j);
    }
  }
      
}


void draw(){
  for (int i = 0; i < COLS; i++) {
    for (int j = 0; j < ROWS; j++) {
       cells[i][j].display();
      }
    }
}

class Cells {
 PVector position;
 boolean isActive;
 color cellc = color(random(255), random(255),random(255));
 
 Cells(int x, int y){
   position = new PVector ( x * cellSize, y * cellSize);
 } 
 
 void display(){
   if(isActive){
     fill(cellc); 
     rect(position.x, position.y, cellSize, cellSize);
   }else{
     if(mouseX > position.x && mouseX < position.x + cellSize && mouseY > position.y && mouseY < position.y + cellSize){
       isActive = true;
     }
   } 
 }
}
