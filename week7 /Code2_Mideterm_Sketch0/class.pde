class button{
//class position, color, text, background color
int Xposition;
int Yposition;
color c;
String text;
color BGC;

  button(int Xposition, int Yposition, color c, String text, color BGC){
    this.Xposition = Xposition;
    this. Yposition = Yposition;
    this.c = c;
    this.text = text;
    this.BGC = BGC;
  }

  void display(){
    ellipse(Xposition, Yposition, buttonSize, buttonSize);
  }
  
  void isInside(){
    if (dist(mouseX, mouseY, Xposition, Yposition) < buttonSize/2 && mousePressed) {
      println("working");
      textToShow = text;
      bgColor = BGC;
      fill(0);
      state = 1;
    } else {
      fill(255);
    }
  }
  
  
  
}
