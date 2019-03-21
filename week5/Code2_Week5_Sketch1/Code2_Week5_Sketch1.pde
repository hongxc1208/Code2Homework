// bryan ma for code 2 sp 19

int scene = 0;
int x;
int y;
int radius;
int rectX;
int rectY;
boolean isClicked;
int timer;


void setup() {
  size(600, 600);
  x = width/2;
  y = height/2;
  radius = 100;
  isClicked = false;
  
  
}

void draw() {
  background(255);
  println(timer);

  switch (scene) {
    case 0:
      fill(0);
      textSize(30);
      text("Hove over", 240, 400);
      ellipse(x, y, radius, radius);
      changeColor();
      break;
    case 1:
      fill(0);
      rect(x, y, radius, radius);
      movingRect();
      break;
    case 2:
      triangle(0, 0, width, 0, width/2, height);
      passwordCode();
      break;
    case 3:
      fill(0);
      textSize(30);
      text("Congradulation!", 100, 100);
      
      break;
    default:
      break;
  }
}


void advance() {
  scene++;
}

void changeColor(){
    if(dist(mouseX, mouseY, x, y) < radius){
        fill(255, 0, 0);
        ellipse(width/2, height/2, radius, radius);
        advance();
      }

}

void movingRect(){
    fill(255,0,0);
    rect(rectX, rectY, radius, radius);
    textSize(30);
    text("Use UP/DOWN/LEFT/RIGHT Arrow",100, 100);
    text("Move to the Black Zone", 100, 200);
    if (key == CODED){
      if(keyCode == UP){
          rectY --;
      } if(keyCode == DOWN){
        rectY ++;
      } if(keyCode == RIGHT){
         rectX ++;
      } if(keyCode == LEFT){
         rectX --;
      }
     
     if (dist(rectX, rectY, x, y) < 10){
       advance();
     }
    }
}


void passwordCode(){
        textSize(30);
        text("HELLO", 100, 500);
    if(keyPressed){
      if(key == 'w' || key == 'W'){
        isClicked = true;
      }
      
      if(isClicked){
         timer = 0;
         timer = millis()/1000;
         //println("w");
         //println(timer);
         fill(0, 0, 255);
         textSize(30);
         text("World",500, 500);
         if (timer == 25){
            advance();
  }
      }
    }
}
