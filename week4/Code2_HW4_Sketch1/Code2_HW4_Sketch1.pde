// bryan ma for code 2 sp19 A

// replace the sizes integer array with csv data loaded externally.
//  store the data externally
//int[] sizes = { 300, 500, 100, 200, 400, 300, 500, 200 };
//  using the to create a array of object;

Table data;
int [] size = new int[8];


void setup() {
  background(0);
  data = loadTable("data.csv");
  size(800, 600);
  
  //String[] sizes = data[0].split(",");
  rectMode(CENTER);

  for (int i = 0; i < data.getColumnCount(); i++) {
    TableRow row = data.getRow(0);
    float x = map(i, 0, 8, 100, 700);
    float y = height/2;
    float w = 50;
    size[i] = row.getInt(i);
    println(size[i]);
    rect(x, y, w, size[i]);
    fill(size[i]*0.5);
  }
}

void draw() {
}
