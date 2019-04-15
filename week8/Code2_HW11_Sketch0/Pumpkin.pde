class Pumpkin{
  PVector pos;
  PVector velocity;
  PVector acceleration;
  float mass;
  float size;
  
  Pumpkin(float x, float y){
    pos = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector (0, 0);
    mass = random(1, 5);
    size = 5* mass;
  }

  void update(){
    velocity.add(acceleration);
    pos.add(velocity);
    acceleration.mult(0);
    
    if(pos.x < 0){
      pos.x = 0;
      velocity.x *= -1;
    } if( pos.x > width - size){
      pos.x = width - size;
      velocity.x *= -1;
    }
    
    if(pos.y > height){
      pos.y = height- size;
      velocity.y *= -1;
    } if(pos.y < 0 ){
      pos.y = 0;
      velocity.y *= -1;
    }
  }
  
   void display(){
     fill(240);
     stroke(0);
     //ellipse(pos.x, pos.y, size, size);
     
     image(ppic, pos.x, pos.y);
     ppic.resize(0, 50);
   }
   
   void applyForce(PVector force){
     PVector f = PVector.div(force, mass);
     acceleration.add(f);
   }

}
