class Ball{
  PVector pos; 
  float Speed = 8;
  float Size = 30;
  PVector vel;
  boolean isLaunch = false;
 
  Ball(float x, float y, float angle){
    pos = new PVector(m1.pos.x, m1.pos.y);
    //vel = new PVector(cos(-20), sin(-30));
    vel = new PVector(cos(radians(angle)),sin(radians(angle + 40)));
    vel.mult(Speed);
  }
  
    void move(){
          pos.add(vel);
    }
  

  void display(){
    noStroke();
    //rotate(radians(3));
    fill(245,202,84);
    ellipse(pos.x, pos.y, Size, Size);
  }  
}
