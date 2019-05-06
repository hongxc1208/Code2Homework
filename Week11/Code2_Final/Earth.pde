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
     scale(0.25);
     image(earth, -280, -280);
  }
}
