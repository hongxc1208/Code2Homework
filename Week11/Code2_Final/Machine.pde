class Machine{
  PVector pos;
  float R;
  
  Machine(float Xpos, float Ypos){
    pos = new PVector (Xpos, Ypos);
    
  }
  
  void display(){
      //pushMatrix();
      //translate(80, 80);
      //use sin & cos for x & y cooridnates 
      //rotate(radians(-70));
      //translate(width/2 - 100, height/2);
      //rotate(radians(R));
      //scale(0.2);
      //rotate(radians(3));
      
      imageMode(CENTER);
      pushMatrix();
      translate(pos.x, pos.y);
      //rotate(radians(frameCount));
      translate(50,70);
      rotate(radians(-15));
      image(machine, 0, 0, 100, 180);
      popMatrix();
   
  }
  
}
