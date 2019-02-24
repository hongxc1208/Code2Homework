class ColorBrick extends Brick{
  float expand;
  ColorBrick(float x, float y, float w, float h){
    super();
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    active = true;
    
  }

  void display(){
    w = expand;
    expand +=1;
    if (expand > 80){
      expand = 0;
    }
    fill(random(255),random(255),random(255));
    rectMode(CORNER);
    stroke(255);
    rect(x, y, w, h);
  }
}
