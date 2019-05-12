PImage machine;
PImage earth;
PImage monster;
Machine m1;
Ball b1;
Earth e1;
int ballr;
float r;
int level = 1;

ArrayList<Ball> balls = new ArrayList<Ball>();
ArrayList<Monster> aliens = new ArrayList<Monster>();

//PVector[] monsterpos = new PVector[level];
PVector[] ballposition = new PVector[balls.size()];
float[] monsterX = new float[level];
float[] monsterY = new float[level];
float[] ballX = new float[300];
float[] ballY = new float[300];

void setup(){
  size(1600, 900);
  machine = loadImage("Machine.png");
  earth = loadImage("earth.png");
  monster = loadImage("Monster.png");
  
  e1 = new Earth(width/2 - 50, height/2 -50);
  m1 = new Machine(0, 0 + 100);
  //b1 = new Ball(m1.pos.x + 30, m1.pos.y);
  
  
  pushMatrix();
  for(int i = 0; i < 1; i ++){
    aliens.add(new Monster(1600, random(height)));
  }
  popMatrix();
}


void draw(){
  background(255);
  //Earth
  e1.display();

  pushMatrix();
  //translate(width/2 - 150, height/2 - 110);
  //translate(100,60);
  
  //Machine
  pushMatrix();
  m1.display();
  m1.update();
  popMatrix();
  
  //Ball
  
   for (int i = 0; i < balls.size(); i++){
    Ball b = balls.get(i);
    b.display();
    b.move();
    ballX[i] = b.pos.x;
    ballY[i] = b.pos.y;
    
    println(ballX[i], "," , ballY[i]);    
  }
  
  popMatrix();
  
  
  //Monster
  pushMatrix();
  
  for(int i= 0; i < aliens.size(); i++){
    Monster tmp = aliens.get(i);
    monsterX[i] = tmp.pos.x;
    monsterY[i] = tmp.pos.y;
    //println(monsterX[i], monsterY[i]);
  }
  
  
  for(Monster m: aliens){
    PVector aForce = new PVector(e1.pos.x, e1.pos.y);
    aForce.sub(m.pos);
    aForce.normalize();
    aForce.mult(0.01 * e1.mass);
    m.applyForce(aForce);
    m.display();
    m.update();
  }
  
  popMatrix();
  hit();  
}

void keyPressed(){
  //add ball to arraylist
     if(keyCode == 32){
      balls.add(new Ball(m1.pos.x + 60, m1.pos.y + 120, m1.R));
  } 
}



void hit(){
  for(int i = 0; i < aliens.size(); i ++){
    if(dist(monsterX[i], monsterY[i], ballX[i], ballY[i]) < 10){
      println("hit");
    }
  
  }

}
