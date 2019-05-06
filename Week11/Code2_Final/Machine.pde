class Machine{
  PVector pos;
  float R;
  
  Machine(float Xpos, float Ypos, float R){
    pos = new PVector (Xpos, Ypos);
    R = this.R;
  }
  
  void display(){
      pushMatrix();
      translate(80, 80);
      //use sin & cos for x & y cooridnates 
      rotate(radians(-70));
      //translate(width/2 - 100, height/2);
      rotate(radians(R));
      scale(0.2);
      image(machine, pos.x, pos.y);
      popMatrix();
      
  }
  
}
