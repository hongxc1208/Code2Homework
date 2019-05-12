class Ball{
  PVector pos;
  PVector vel;
  
  Ball(float angle){
    pos = new PVector(width/2, height/2);
    vel = new PVector(cos(radians(angle)), sin(radians(angle)));
    vel.mult(6);
  }
    
  void update(){
    pos.add(vel);
  }
  
  void display(){
    noStroke();
    fill(245,202,84);
    ellipse(pos.x,pos.y, 40, 40);
  
  }
}
