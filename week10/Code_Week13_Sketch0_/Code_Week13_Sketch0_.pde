float theta = 0;
PImage cloth;

void setup() {
  size(800, 600);
  cloth = loadImage("data.png");

  
}

void draw() {
  background(255);
  pushMatrix();
  translate(100, 430);
  image(cloth, 0, 0);
  popMatrix();
  
  strokeWeight(1);
  translate(width/2, height - 100);
  branch(150);
  
  textSize(30);
  fill(0);
  text("Press your mouse", -100, -300); 
  
  
  

}



void branch(float len) {
  line(0, 0, 0, -len);
  theta = map(mouseX, 0, width, 40, 80);
  translate(0, -len);
  len *= map(mouseY, 0, height, 0.5, 0.7);
    //println(theta);

  if (len > 2) {
    pushMatrix();
    rotate(radians(theta));
    branch(len);
    popMatrix();

    pushMatrix();
    rotate(radians(-theta));
    branch(len);
    popMatrix();
  }
  
  if(len< 2){
    pushMatrix();
    rotate(radians(theta));
    fill(255, 0, 0);
    ellipse(0, 0, len * 3, len * 3);
    popMatrix();
  }
 
      float pos;
      float gravity = 0;
      pos = -len + gravity;
      gravity --;
      fill(255, 226, 112);
      ellipse(0, 0, pos*3, pos*3);
      
      if (mousePressed == true){
        theta -= random(-2, 2);
      }
  
}
