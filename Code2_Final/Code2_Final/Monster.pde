class Monster{
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;
  float size;
  
  Monster(float x, float y){
    pos = new PVector(x, y);
    vel = new PVector (0, 0);
    acc = new PVector (0, 0);
    mass = random(1,2);
    size = 3 * mass;
  }
  
  void display(){ 
   image(monster, pos.x, pos.y, 150, 180);
  }
  
  void update(){
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }
  
  void applyForce(PVector force){
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }



}
