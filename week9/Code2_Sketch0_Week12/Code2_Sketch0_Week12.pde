float scale = 0;
ArrayList<Stone> stones = new ArrayList <Stone>();


Star s1;
void setup(){
  size(800, 800, P3D);


  s1 = new Star(0, 0, 0);
  for(int i = 0; i < 50; i ++){
    stones.add(new Stone(random(100, 200), random(0, 30), random(0, 300)));
    
  }
}

void draw(){
  background (0);
 
  s1.display();
  
  for(Stone s: stones){
       PVector gravityForce = new PVector(s1.pos.x, s1.pos.y, s1.pos.z);
       gravityForce.sub(s.pos);
       gravityForce.normalize();
       gravityForce.mult(0.01 * s1.mass);
       s.applyForce(gravityForce);
       s.update();
       s.display();
  }
}


  
  
