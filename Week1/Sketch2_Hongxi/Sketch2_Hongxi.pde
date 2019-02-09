//use sin to move ellipse horizontally
//change to vertically is clicked on. 

float xpos;
float ypos;
float xspeed = 3;
float yspeed = 3;
float xdirection = 1;
float ydirection = 1;
boolean isClicked = false;
int radius = 50;
float angle;

void setup(){
  size(600,600);
  

}

void draw(){
  background(255);
  
  if (isClicked == false){
     ellipse(xpos, ypos, radius, radius);
      println(xpos, ypos);
      angle += 0.01;
      xpos = width/2;
      ypos = (sin(angle)) *300 +300;
  } 
  if(mouseX > xpos -60 && mouseX < xpos +60 && mouseY > ypos -60 && mouseY < ypos +60 && mousePressed){
    println("inside");
    isClicked = true;
    xpos = (sin(angle))*300;
    ypos = height/2;
    ellipse(xpos, ypos, radius, radius);
    println(xpos,ypos);
    
    
  
  }
 
}
