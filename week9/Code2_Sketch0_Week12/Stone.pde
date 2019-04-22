class Stone{
  PVector pos;
  PVector velocity;
  PVector acceleration;
  float mass;
  float size;

  Stone(float x, float y, float z){
    pos = new PVector(x, y, z);
    velocity = new PVector (0, 0);
    acceleration = new PVector (0, 0);
    mass = random (5, 8);
    size = 3 * mass;
  }

  void update(){
    velocity.add(acceleration);
    pos.add(velocity);
    acceleration.mult(0);
   
  }
  
  void display(){
    lights();
    noFill();
    stroke(240);
    translate(pos.x, pos.y, pos.z);
    sphere(size);
  }
  
  void applyForce(PVector force){
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
}
  
