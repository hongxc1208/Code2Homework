class Wormhole{
  PVector pos;
  PVector vel;
  float mass;
  float size;
  
  Wormhole(float angle){
    pos = new PVector(width/2, height/2);
    vel = new PVector(cos(radians(angle)), sin(radians(angle)));
    vel.mult(6);
    mass = 20;
    size = 20 * mass;
  }
    
  void update(){
    pos.add(vel);
  }
  
  void display(){
    image(wormhole, pos.x, pos.y, 120, 100);
  
  }
}
