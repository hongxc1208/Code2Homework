// bryan ma for code 2 sp 19 A

Table data;
int R;
int G;
int B;

void setup() {
  size(600,600);
  data = loadTable("data.csv", "header");
  
  for (int i = 0; i < data.getRowCount(); i++) {
    TableRow row = data.getRow(i);
    int x = row.getInt("x");
    int y = row.getInt("y");
    int size = row.getInt("size");
    R = row.getInt("R");
    G = row.getInt("G");
    B = row.getInt("B");
    ellipse(x, y, size, size);
    fill(R, G, B);
  }
}

void draw() {}

void mousePressed() {
  int s = int(random(50, 200));
  R = int(random(0,255));
  G = int(random(0,255));
  B = int(random(0,255));
  ellipse(mouseX, mouseY, s, s);
  fill(R, G, B);
  TableRow newRow = data.addRow();
  newRow.setInt("x", mouseX);
  newRow.setInt("y", mouseY);
  newRow.setInt("size", s);
  newRow.setInt("R", R);
  newRow.setInt("G", G);
  newRow.setInt("B", B);
  saveTable(data, "data/data.csv");
}
