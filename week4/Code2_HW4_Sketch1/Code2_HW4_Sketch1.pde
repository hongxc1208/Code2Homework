// bryan ma for code 2 sp19 A

// replace the sizes integer array with csv data loaded externally.
//  store the data externally
//int[] sizes = { 300, 500, 100, 200, 400, 300, 500, 200 };
//  using the to create a array of object;
final int NUM = 8;
String[] data;
int[] shapeH = new int[8];

void setup() {
  background(0);
  data = loadStrings("data.csv");
  size(800, 600);
  
  String[] sizes = data[0].split(",");
  rectMode(CENTER);

  for (int i = 0; i < sizes.length; i++) {
    float x = map(i, 0, sizes.length - 1, 100, 700);
    float y = height/2;
    float w = 50;
    shapeH[i] = int(sizes[i]);
    rect(x, y, w, shapeH[i]);
    fill(shapeH[i]*0.5);
  }
}

void draw() {
}
