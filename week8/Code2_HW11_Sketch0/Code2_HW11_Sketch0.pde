PImage ppic;
PImage candy1;

ArrayList<Candy> candies = new ArrayList<Candy>();
ArrayList<Pumpkin> pumpkins = new ArrayList<Pumpkin>();

void setup(){
  size(800, 800);
  ppic = loadImage("pumpkinpic.png");
  candy1 = loadImage("candy1.png");
  
  for ( int i = 0; i < 50; i ++){
      pumpkins.add(new Pumpkin(random(width), random(height))); 
  }
  
}

void draw(){
  background(0);
  
  for (Candy c: candies){
     c.display();
  }

  for (Pumpkin p: pumpkins){
    for(Candy c: candies){
    PVector force = new PVector(c.pos.x, c.pos.y);
    //PVector friction = p.velocity.copy();
    //friction.mult(-1);
    //friction.normalize();
    //friction.mult(0.04);
    force.sub(p.pos);
    force.normalize();
    force.mult(0.02 * c.mass);
    p.applyForce(force);
    //p.applyForce(friction);
    }
    p.update();
    p.display();
  }
}

void keyPressed(){
  for(Pumpkin p: pumpkins){
    PVector impluse = new PVector(random(-1, 1), random(-10, -5));
    p.applyForce(impluse);
  
  }
  
}

void mousePressed(){
  candies.add(new Candy(mouseX, mouseY));
}
