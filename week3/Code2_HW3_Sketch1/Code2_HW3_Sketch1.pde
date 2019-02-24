//array of containers;

final int COLS = 5;
final int ROWS = 5;

Circle[][] circle = new Circle[COLS][ROWS];

void setup(){
  size(600,600);
  background(0);
  
  for(int i = 0; i < COLS; i++){
    for(int j = 0; j < ROWS; j++){
      circle[i][j] = new Circle(i,j);
    }
  }
}

void draw(){
  for(int i = 0; i< COLS; i++){
    for(int j = 0; j < ROWS; j++){
      circle[i][j].display();
    }
  }

}
