//position, color, size;

class Circle{
  float x;
  float y;
  float radius;
  color c;
  
  Circle(int i, int j){
    x = map(i, 0, COLS, 0, width);
    y = map(j, 0, ROWS, 0, height);
    c= color(0, random(255),random(255));
    radius = random(20,60);
  }
  
  void display(){
     fill(c);
     ellipse(x+radius, y+radius, radius, radius);
  }

}
