class Earth{
  PVector pos;
  float mass;
  float size;
  
  Earth(float x, float y){
    pos = new PVector (x, y);
    mass = 5;
    size = 20 * mass;
  }
  
  void display(){
     image(earth, pos.x, pos.y, 150, 150);
  }
}
