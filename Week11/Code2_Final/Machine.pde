class Machine{
  PVector pos;
  float R;
  
  Machine(float Xpos, float Ypos){
    pos = new PVector (Xpos, Ypos);
    
  }
  
  
  void update(){
    if(keyPressed){
      if(key == CODED){
        if(keyCode == LEFT){  
           R -= 2;
        } if(keyCode == RIGHT){
            R += 2;
        }
      }
    }
  }
  
    void display(){
      imageMode(CENTER);
      pushMatrix();
      rotate(radians(R));
      translate(pos.x, pos.y);
      //rotate(radians(frameCount));
      translate(50,70);
      rotate(radians(-15));
      image(machine, 0, 0, 100, 180);
      popMatrix();
     
  }
  
}
