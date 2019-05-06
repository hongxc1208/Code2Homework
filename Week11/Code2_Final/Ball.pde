class Ball{
  PVector pos; 
  float Speed = 8;
  float Size = 30;
  float direction = 1;
  PVector vel;
  boolean isLaunch = false;
 
  Ball(float x, float y){
    pos = new PVector(x, y);
    vel = new PVector(cos(-20), sin(-30));
    vel.mult(Speed);
    
    println(vel);
  }
  
    void move(){
     if(keyCode == 32){
       isLaunch = true; 
     }
    
     if(isLaunch == true){
          pos.add(vel);
       }
    }
  

  void display(){
    //rotate(radians(-70));
    //translate(80,80);
    noStroke();
    fill(245,202,84);
    ellipse(pos.x, pos.y, Size, Size);
  }  
}
  