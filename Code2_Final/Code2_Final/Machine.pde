class Machine{
  float angle;
  PVector pos;
  float mass;
  
  Machine(float xPos, float yPos){
    pos = new PVector(xPos, yPos);
    mass = 5;
  }
  
  void update(){
    if(keyPressed){
      if(key == CODED){
        if(keyCode == LEFT){
          angle -= 3;  
        }
        if(keyCode == RIGHT){
          angle += 3;
        }
      }
    } 
  }
  
  void display(){
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(angle));
    imageMode(CENTER);
    image(machine, 0, 0, 288, 160);
    popMatrix();
  }


}
