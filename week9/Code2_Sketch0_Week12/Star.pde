class Star{
  PVector pos;
  float mass;
  float size;
  float n;
  
  Star(float x, float y, float z){
    pos = new PVector (x, y, z);
    mass = 5;
    size = n;
  }
  
  void display(){
    scale = scale + 0.01;
    n = noise(scale);
    n = map (n, 0, 1, 100, 200);
    lights();
    translate(width/2, height/2, 0);
    noFill();
    stroke(244, 170, 66);
    sphere(n - 50);
    stroke(255, 0, 0);
    sphere(n);
  }
}
