class Rect{
  int RectPos;
  int RectColor;
  
  Rect(int RectPos, int RectColor){
    this.RectPos = RectPos;
    this.RectColor = RectColor;
    
  }
  
  void display(){
    rect(10 + (RectPos *100), height/2, RectColor, RectPos*RectColor);
    fill(RectPos*RectColor, RectColor, RectColor);
  }
  
}
