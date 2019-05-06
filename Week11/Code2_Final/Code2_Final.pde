PImage machine;
PImage earth;
PImage monster;
Machine m1;
Ball b1;
Earth e1;

float r;
ArrayList<Ball> balls = new ArrayList<Ball>();
ArrayList<Monster> aliens = new ArrayList<Monster>();

void setup(){
  size(1600, 900);
  machine = loadImage("Machine.png");
  earth = loadImage("earth.png");
  monster = loadImage("Monster.png");
  
  m1 = new Machine(0, 300, 0);
  b1 = new Ball(m1.pos.x, m1.pos.y);
  e1 = new Earth(-280, -280);
  
  pushMatrix();
  for(int i = 0; i < 3; i ++){
    aliens.add(new Monster(random(width), random(height)));
  }
  popMatrix();
}


void draw(){
  background(255);
  
  //Earth
  translate(width/2, height/2);
  pushMatrix();
  e1.display();
  popMatrix();
  


  //Machine
  pushMatrix();
  rotate(radians(r*3));
  m1.display();
  popMatrix();
  
  //Ball
  pushMatrix();
  rotate(radians(r*3));
  b1.display();
  b1.move();

  for (int i = 0; i < balls.size(); i++){
    Ball b = balls.get(i);
    b.display();
    b.move();
  }
  popMatrix();
  
  
  //Monster
  pushMatrix();
  for(Monster m: aliens){
    PVector aForce = new PVector(e1.pos.x, e1.pos.y);
    aForce.sub(m.pos);
    aForce.normalize();
    aForce.mult(0.02 * e1.mass);
    m.applyForce(aForce);
    m.display();
    m.update();
  }
  
  popMatrix();
  
  
  //println(alien1.pos);
  
  
  
}

void keyPressed(){
  //Machine Rotation
  if(key == CODED){
    if(keyCode == LEFT){
      r += 2.5;
    } if(keyCode == RIGHT){
      r -= 2.5;
    }
  }
  
  //add ball to arraylist
  if(keyCode == 32){
    balls.add(new Ball(m1.pos.x, m1.pos.y));
  }
}
