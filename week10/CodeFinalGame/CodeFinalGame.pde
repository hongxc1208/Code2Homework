import processing.video.*;
Movie myMovie;

//drag wormhole (variable to store the location [when clicked p, the location stay])
//wormhole can be rotate when "down" buttom pressed, rotated 90 degrees
//Once the ball touch the Wormhole1, the ball goes out from Wormhole2(The location of ball is change)
//press the launch button to release the ball from the machine
//if ball location reach the Monster location, the monster disappear. 
//One Monster disapper = One Score 
//Level 1 = 1 Score = compelete, Level 2 = 2 score compelte 
//Click the reset button to reset the wormhole and score. 

//Monster move left to right 
//congratulation screen 
//10 ball array position list 


PImage StartScreen;
PImage CongratulationScreen;

PImage PanelBackground;
PImage ResetButton;
PImage LaunchButton;
PImage Panel;
PImage Wormhole;
PImage Machine;
PImage Bomb;
PImage Monster;
PFont myFont;
float wormholeOriginalPositionX = 68;
float wormholeOriginalPositionY = 308;
float bombOrignialPositionX = 416;
float bombOrignialPositionY = 500;
float speed = 30;
int angle = 180; 
int gamelevel = 1;
int wormholenumber;
int score;
int WormHoleLeave;
int hitMonster;
boolean isLaunch = false;
boolean GameStart = false;




Bomb fire1;
Wormhole circle1;
Wormhole circle2;
Monster creature1;

void setup(){
  size(1600, 900);
  StartScreen = loadImage ("StartScreen.png");
  CongratulationScreen = loadImage ("CongratulationScreen.png");
  myFont = createFont("CasanovaScotia",40);
  myMovie = new Movie (this, "Sound.mp4");
  Monster = loadImage("Monster.png");
  PanelBackground = loadImage("PanelBackground.png");
  ResetButton = loadImage("ResetButton.png");
  LaunchButton = loadImage("LaunchButton.png");
  Panel = loadImage("Panel.png");
  Wormhole = loadImage("Wormhole.png");
  Machine = loadImage("Machine.png");
  Bomb = loadImage("Ball.png");
 
  circle1 = new Wormhole(wormholeOriginalPositionX, wormholeOriginalPositionY);
  circle2 = new Wormhole(wormholeOriginalPositionX, wormholeOriginalPositionY);
  
  fire1 = new Bomb (bombOrignialPositionX, bombOrignialPositionY);
  //creature1 = new Monster (random(300, 800), random(0, 900));
  creature1 = new Monster (random(600,1300), random(0,500));
  
}

void movieEvent(Movie m){
  m.read();

}


void draw(){

  background(255);
  image(myMovie, 1700, 1000, width, height);
  pushMatrix();
  scale(1.28);
  image(StartScreen, -200, -80, width, height);  
  popMatrix();
  

 

  
  if (mousePressed == true){
    GameStart = true;
    
  }
  
  
  if (GameStart == true){
      background(255);
  
  //left side Control Panel
  translate(10, 0);
  pushMatrix();
  scale(1.12);
  image(PanelBackground, -190, -10);
  popMatrix();
  
  pushMatrix();
  scale(0.6);
  image(ResetButton, 0, 1180);
  image(LaunchButton, 0, 1315);
  image(Panel, 0 , 200);
  popMatrix();
  
  pushMatrix();
  scale(0.5);
  image(Machine, 650, 1013);
  popMatrix();
  
  //println(mouseX, mouseY);
  
  //Bomb
  
  fire1.display();
  fire1.move();
  fire1.PassThrough();
  fire1.done();
  
  //Monster
  creature1.move();
  creature1.display();
  creature1.hit();

  
  //Wormholes
  
  pushMatrix();
  //translate(width/2, height/2);
  //rotate(angle);
  //println("circle1:"+ circle1.x, circle1.y);
  //println("circle2:"+ circle2.x, circle2.y);
  println("fire1: "+ fire1.x, fire1.y);
  println("mouseX:"+ mouseX, mouseY);
  //println("dist:" + dist(fire1.x, fire1.y, circle1.x, circle1.y));
  println("dist:" + (dist(fire1.x, fire1.y, creature1.x, creature1.y)));
  println("monster:" + creature1.x, creature1.y);
  circle1.display();
  popMatrix();
  pushMatrix();
  circle2.display();
  popMatrix();
  circle1.move1();
  circle1.reset();
  circle2.move2();
  circle2.reset();
  //circle1.clickToRotate();
  
  
  //wormholenumber display text
   
  wormholenumber = gamelevel +1 - WormHoleLeave;
  
  textFont(myFont);
  textAlign(CENTER, CENTER);
  fill(0);
  text("x" + wormholenumber, 135, 460);
  
  
  //score display text
  
  score = 0 + hitMonster;
  textFont(myFont);
  textAlign(CENTER, CENTER);
  fill(0);
  text(score, 140, 570);
  
  if (score == 1 ){
   image(CongratulationScreen, width/2 - 150, height/2 - 200, 500, 400);
  }
  
  
  //GameLevel text
  
  textFont(myFont);
  textAlign(CENTER, CENTER);
  fill(0);
  text(gamelevel, 140, 200);
  
  }
  
  




}


class Bomb {
  float x;
  float y;

  
  Bomb(float tempX, float tempY){
    x = tempX;
    y = tempY;

   
  }
  
  void display(){
    pushMatrix();
    scale(0.6);
    image(Bomb, x/0.6, y/0.6);
    popMatrix();
  }
  
  void move(){
    if (mouseX > 12 && mouseX < 272 && mouseY > 793 && mouseY < 856 ){
        if(mousePressed == true){
          isLaunch = true;
          myMovie.play();
          }
      
        if(isLaunch == true ){
           y = y - speed;
        }
      }
      
      if (key == CODED){
        if (keyCode == CONTROL){
          myMovie.play();
          y = y - speed;
        
        }
      
      
      }
    }
        
  
  
  
  void PassThrough(){
     if (dist(fire1.x, fire1.y, circle1.x, circle1.y)< 60){
      println("close");
      x = circle2.x +40;
      y = circle2.y;
    }
  }
  
  void done(){
    if (dist(fire1.x, fire1.y, creature1.x, creature1.y)< 205){
      x = 2000;
      y = 1700;
  
  }
  
  }



}


class Monster{
  float x;
  float y;
  
  Monster (float tempX, float tempY){
    x = tempX;
    y = tempY;
  
  }
  
  
  void display(){
    pushMatrix();
    scale(0.5);
    image(Monster, x/0.5, y/0.5);
    popMatrix();
  
  }
  
  void hit(){
     if (dist(fire1.x, fire1.y, creature1.x, creature1.y) < 225){
      hitMonster =+ 1;
      //x = 1700;
      //y = 1000;
    }
  }

  void move(){
   
    float xspeed = 0.33;
    float xdirection = 1;
    float XrandomPositionPerSecond;
    float YrandomPositionPerSecond;
    
    XrandomPositionPerSecond = random(500, 1300);
    YrandomPositionPerSecond = random(0, 200);
    
    //x =  xspeed * XrandomPositionPerSecond;
    //y =  xspeed * YrandomPositionPerSecond;
    

    
    println(x);
    
    //int randomNumber;
    //randomNumber = int(random(0,2)) / second();
    //  if (randomNumber == 0){
    //    x -= 5;
        
      
    //  }
      
    //  if (randomNumber == 1){
    //    println("1");
        
    //    x += 5;
      
    //  }
    
  
  }

}




class Wormhole {
  float x ;
  float y ;

  
  Wormhole(float tempX, float tempY){
    x = tempX;
    y = tempY;
       
   
  }
  
  void display(){
    pushMatrix();
    scale(0.305);
    image(Wormhole, x/0.305, y/0.305);
    popMatrix();
    
    
    if(circle1.x > 146){
       WormHoleLeave = 1;     
       }
      
        if(circle2.x > 146){
           WormHoleLeave = 2;
         } 
         
           if (circle1.x < 146 && circle2.x < 146){
               WormHoleLeave = 0;
         }

  }

  
  void reset(){
 
     if(mouseX > 12 && mouseX < 272 && mouseY > 710 && mouseY < 772){
        if(mousePressed == true){
        //println("click");
          x = wormholeOriginalPositionX;
          y = wormholeOriginalPositionY;
         }
    }
  
  }
  
  void move1(){
    if(keyPressed){
      if(key == 'q'){
        x = mouseX;
        y = mouseY;
      }
    }
      
  }
  

  
  void move2(){
    if(keyPressed){   
      if(key == 'w'){      
      x = mouseX;
      y = mouseY;     
      }
    }
      
  }
  
  //void clickToRotate(){
  
  //  if(keyPressed){
  //    if(keyCode == DOWN){
       
  //      angle = mouseX;
  //    }
    
  //  }
  
  //}

  


}
