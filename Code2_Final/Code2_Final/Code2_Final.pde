import processing.sound.*;
SoundFile gunEffect;
SoundFile monsterExplosion;
SoundFile wormholeEffect;
SoundFile backgroundMusic;
SoundFile rewardEffect;
PImage machine;
PImage monster;
PImage earth;
PImage good;
PImage wormhole;
PImage backgroundImage;
PImage case0;

Machine m1;
Earth e1;
int level = 0;
int score;
PFont casanova;
int life = 3;
int wormholePercent;

ArrayList<Ball> balls = new ArrayList<Ball>();
ArrayList<Wormhole> wormholes = new ArrayList<Wormhole>();
ArrayList<Monster> aliens = new ArrayList<Monster>();
ArrayList<Good> goodaliens = new ArrayList<Good>();
float[] ballX = new float[3000];
float[] ballY = new float[3000];
float[] wormholeX = new float[3000];
float[] wormholeY = new float[3000];
float[] monsterX = new float[300];
float[] monsterY = new float[300];
float[] goodX = new float[3000];
float[] goodY = new float[3000];

void setup(){
  size(1600, 900, P2D);
  score = 0;
  earth = loadImage("earth.png");
  machine = loadImage("Machine.png");
  monster = loadImage("Monster.png");
  good = loadImage("Good.png");
  wormhole = loadImage("Wormhole.png");
  backgroundImage = loadImage("background.jpg");
  case0 = loadImage("case0.png");
  gunEffect = new SoundFile(this, "soundEffect.aiff");
  monsterExplosion = new SoundFile( this, "monsterExplosion.aiff");
  wormholeEffect = new SoundFile(this, "wormholeEffect.aiff");
  backgroundMusic = new SoundFile(this, "background.mp3");
  rewardEffect = new SoundFile(this, "reward.wav");
  backgroundMusic.loop();
  m1 = new Machine(0, 0);
  e1 = new Earth(800, width/2 + 200);
  casanova = createFont("Casanova Scotia.otf", 30);
  
  pushMatrix();
  for(int i = 0; i < 1; i ++){
    aliens.add(new Monster(random(0, 1600), 0));
  }
  popMatrix();


}


void draw(){
  background(255);

  switch(level){
    case 0:
      image(case0, 0, 0, 1600, 900);
      break;
    case 1:
      image(backgroundImage, width/2, height/2, 1600, 900);
      
      fill(87, 41, 173);
      textFont(casanova);
      textSize(30);
      text("score:    " + score, 50, 850);
      text("life:     " + life, 1250, 850);
      text("Wormhole%   " + wormholePercent, 1250, 800);
    
      //earth
      e1.display();
     
      
      hit();
      pushMatrix();
      //machine
      translate(0, 150);
      m1.display();
      m1.update();
    
      //ball
      for(Ball b: balls){
        b.update();
        b.display();
      }
      
      for(int i = 0; i < balls.size(); i ++){
        Ball b = balls.get(i);
        ballX[i] = b.pos.x;
        ballY[i] = b.pos.y;
        
        if(b.pos.x < 0 || b.pos.x > width || b.pos.y < -150 || b.pos.y > height){
          balls.remove(i);
        }
        //println(ballX[i], "," , ballY[i]);
      }
      popMatrix();
      
      //monster
      
        for(Monster m: aliens){
        PVector aForce = new PVector(e1.pos.x, e1.pos.y);
        aForce.sub(m.pos);
        aForce.normalize();
        aForce.mult(0.001 * e1.mass);
        m.applyForce(aForce);
        m.display();
        m.update();
      }
      
      
        for(int i= 0; i < aliens.size(); i++){
          Monster m = aliens.get(i);
          monsterX[i] = m.pos.x;
          monsterY[i] = m.pos.y;
          //println(dist(e1.pos.x, e1.pos.y, monsterX[i], monsterY[i]));
          if(dist(e1.pos.x, e1.pos.y, monsterX[i], monsterY[i]) < 360){
            //println("enter!!!!!!");
            aliens.remove(i);
            life = life -1;
          }
          //println(monsterX[i], "," , monsterY[i]);
        }
        
        //good aliens
        for(Good g: goodaliens){
        PVector aForce = new PVector(e1.pos.x, e1.pos.y);
        aForce.sub(g.pos);
        aForce.normalize();
        aForce.mult(0.001 * e1.mass);
        g.applyForce(aForce);
        g.display();
        g.update();
      }
      
      for(int i= 0; i < goodaliens.size(); i++){
          Good g = goodaliens.get(i);
          goodX[i] = g.pos.x;
          goodY[i] = g.pos.y;
          //println(dist(e1.pos.x, e1.pos.y, monsterX[i], monsterY[i]));
          if(dist(e1.pos.x, e1.pos.y, goodX[i], goodY[i]) < 360){
            println("Good!!!!!!");
            rewardEffect.play();
            wormholePercent += 25;
            goodaliens.remove(i);
          }
          //println(monsterX[i], "," , monsterY[i]);
        }
        
        //game over
        if(life == 0){
            level = 2;
        }
        
        //wormhole
        pushMatrix();
        translate(0, 150);
        for(Wormhole w: wormholes){
        w.update();
        w.display();
        }
        
        
        for(int i = 0; i < wormholes.size(); i ++){
        Wormhole w = wormholes.get(i);
        wormholeX[i] = w.pos.x;
        wormholeY[i] = w.pos.y;
        if(w.pos.x < 0 || w.pos.x > width || w.pos.y < -150 || w.pos.y > height){
          wormholes.remove(i);
          }
        }
        
        popMatrix();
        
        for(Monster m: aliens){
          for(int i = 0; i < wormholes.size(); i ++){
            Wormhole w = wormholes.get(i);
            PVector aForce = new PVector(w.pos.x, w.pos.y);
            aForce.sub(m.pos);
            aForce.normalize();
            aForce.mult(0.001 * w.mass);
            m.applyForce(aForce);
            m.display();
            m.update();
          }
       }

        
      
      
      break;
    case 2:
      background(255);
      
      pushMatrix();
      translate(width/2, height/2);
      textAlign(CENTER);
      fill(245,202,84);
      textFont(casanova);
      textSize(70);
      text("GAMEOVER", 0, - 200);
      
      fill(245,202,84);
      textFont(casanova);
      textSize(70);
      text("SCORE:  " + score, 0, -100);
    
      //restart
      rectMode(CENTER);
      fill(0);
      rect(0, 100, 200, 60);
      fill(245,202,84);
      textFont(casanova);
      textSize(30);
      text("RESTART", 0,110);
      
      if(mouseX < 900 && mouseX > 700 && mouseY > 520 && mouseY < 580 && mousePressed == true){
          score = 0;
          level = 1;
          life = 3;
          wormholePercent = 0;
          aliens.clear();
          wormholes.clear();
          balls.clear();
          goodaliens.clear();      
      }
      textAlign(BASELINE);
      
      
      popMatrix();
      break;
    default:
  }
  
  
  
 
}




void keyPressed(){
  if(key == ' '){
    gunEffect.play();
    balls.add(new Ball(m1.angle));
    int randomNumb = int(random(1, 5));
    int randomPos = int(random(5));
    //println(randomNumb);
      if (randomNumb == 2 || randomNumb == 4 || randomNumb == 1){
        aliens.add(new Monster(random(0, 1600), -100));
      } if(randomNumb == 1 && randomPos == 0){
         goodaliens.add(new Good(0, random(0, 600)));
      } if(randomNumb == 1 && randomPos == 1){
         goodaliens.add(new Good(1600, random(0, 600)));
        }
      }
      
       
      
      if( wormholePercent >= 100 && key == 'w' || key == 'W'){
        //println("working");
        wormholes.add(new Wormhole(m1.angle));
        wormholeEffect.play();
        aliens.add(new Monster(random(0, 1600), -100));
        wormholePercent -= 100;
      }
}
    
     
    

void hit(){
  for(int i = 0; i < balls.size(); i++){
    for(int j = 0; j < aliens.size(); j++){
      //println(dist(ballX[i], ballY[i], monsterX[j], monsterY[j]));
      //println(e1.pos.x, e1.pos.y);
      if(dist(ballX[i], ballY[i] + 150, monsterX[j], monsterY[j]) < 60){
        balls.remove(i);
        aliens.remove(j);
        monsterExplosion.play();
        score += 100;
      }
    }
  }
  
  for(int i = 0; i < wormholes.size(); i++){
      for(int j = 0; j < aliens.size(); j ++){
       println(dist(wormholeX[i], wormholeY[i] + 150, monsterX[i], monsterY[i]));
       if(dist(wormholeX[i], wormholeY[i] + 150, monsterX[i], monsterY[i]) < 120){
         aliens.remove(j);
         score += 1000;
       }
      }
    }
}

void mousePressed(){
  if(level == 0){
    level ++;
  }
}
