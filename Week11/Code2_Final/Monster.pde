class Monster{
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;
  float size;
  
  Monster(float x, float y){
    pos = new PVector (x, y);
    vel = new PVector (0, 0);
    acc = new PVector (0, 0);
    mass = random(2,3);
    size = 5 * mass;
  }
  
  void display(){
   pushMatrix(); 
   scale(0.3);
   image(monster, pos.x, pos.y);
   popMatrix();
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
