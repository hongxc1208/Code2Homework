class DataShape { 
  int xPos;
  int yPos;
  int h;
  int w = 35;
  color c;
  String num;
  int numypos;

  
  DataShape (int xPos, int yPos, int h, color c, String num, int numypos){
    this.xPos = xPos;
    this.yPos = yPos;
    this.h = h;
    this.c = c;
    this.num = num;
    this.numypos = numypos;
  }
  
  void display(){
    fill(c);
    rect(xPos, yPos, w, h);   
    fill(0);
    textSize(10);
    text(num, xPos+3, numypos);
  }
  
  
} 

class ChartCode{
  int xpos;
  int ypos;
  int h = 20; 
  int w = 20;
  String text;
  color c;
  
  ChartCode(int xpos, int ypos, int c, String text){
    this.xpos = xpos;
    this.ypos = ypos;
    this.c = c;
    this.text = text;
  }
 
  void display(){
    fill(c);
    rect(xpos, ypos, w, h);
    textSize(20);
    text(text, xpos + 50, ypos + 20);
  }
}
  
