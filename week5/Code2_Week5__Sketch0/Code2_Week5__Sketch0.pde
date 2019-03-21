// bryan ma for code 2 sp 19

int slide = 0;

color[] slideColors = {
  color(100, 120, 180),
  color(180, 120, 100),
  color(120, 100, 180),
  color(255)
};

String[] differentTexts ={
  "Today is Spring Break", 
  "I enjoy my day", 
  "It's beautiful", 
  "Happy and enjoy"
};

 

void setup() {
  size(600, 600);
}

void draw() {
  background(slideColors[slide]);
  textSize(32);
  fill(0);
  text(differentTexts[slide], width/2 - 100, height/2);
  
}

void keyPressed() {
  println("working");
  switch (slide) {
    case 0: 
      
    case 1:
      
    case 2:
      
    case 3:
      advance();
      break;
    default:
      break;
  }
}

void advance() {
  
  slide++;
}
