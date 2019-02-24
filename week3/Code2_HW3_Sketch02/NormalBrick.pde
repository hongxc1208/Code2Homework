class NormalBrick extends Brick{
  NormalBrick(float x, float y, float w, float h){
    super();
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    active = true;
    
  }

  void display(){
    rectMode(CORNER);
    stroke(255);
    fill(0);
    rect(x, y, w, h);
  }
}
