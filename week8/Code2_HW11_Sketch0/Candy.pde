class Candy{
  PVector pos;
  float mass;
  float size;
  
  Candy(float x, float y){
    pos = new PVector(x, y);
    mass = random(1, 5);
    size = 30 * mass;
  }

  void display(){
    //fill(0);
    //ellipse(pos.x, pos.y, size, size);
      image(candy1, pos.x, pos.y);
      candy1.resize(0, 80);
  }
}
