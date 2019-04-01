
int state = 0;

button B1; 
button B2;

int[] Xpos = {180, 420};
int[] Ypos = {200, 200};
color[] BGC = {color(230,255,200), color(255,200,230)};
String[] Text = {"button 1 pressed!", "button 2 pressed!"};

color bgColor = color(230);
int buttonSize = 125;
String textToShow = "";

String[] data;

void setup() {
  size(600, 600);
  data = loadStrings("data.txt");
  
  String[]XposData = data[0].split(",");
  String[]YposData = data[1].split(",");
  println(YposData);
}

void draw() {
  background(bgColor);
  
   for(int i = 0; i < 2; i ++){
      B1 = new button (Xpos[i], Ypos[i], BGC[i], Text[i], BGC[i]);
      B1.display();
      B1.isInside();
      B2 = new button( Xpos[i], Ypos[i], BGC[i], Text[i], BGC[i]);
      B2.display();
      B2.isInside();
      changeState();
  }

  fill(0);
  textAlign(CENTER);
  textSize(28);
  text(textToShow, width/2, 400);
}


void changeState(){
  switch(state){
    case 0: 
      if (dist(mouseX, mouseY, B1.Xposition, B1.Yposition) < buttonSize/2 && mousePressed) {
        state = 1;
    }
    if (dist(mouseX, mouseY, B2.Xposition, B2.Yposition) < buttonSize/2 && mousePressed) {
        state = 2;
    }
      break;
    case 1: // if mouse is inside A and pressed state = 1;
      println("state1");
      advance();
      break;
    case 2: // if mouse is inside B and pressed state = 2;
      println("state2");
      advance();
      break;
    default:
      break;
  }
}

void advance(){
  state = 0;
}
