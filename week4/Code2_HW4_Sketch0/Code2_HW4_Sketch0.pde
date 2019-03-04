// bryan ma for code 2 sp 19 A
//Create a array of objects;
//Each class should have a constructor that takes the value stored in string as an argument;
//myObjects[i] = new myObject(splitData[i]);

final int NUM = 6;

String[] data;
int[] ShapePos = new int [6];
int[] ShapeSize = new int[6];

void setup() {
  data = loadStrings("dataPos.txt");
  
  size(600, 600);
  String[] splitData = data[0].split(",");
  String[] splitDataSiz = data[1].split(",");
  
  for (int i = 0; i < splitData.length; i++) {
      ShapePos[i] = int(splitData[i]);
      ShapeSize[i] = int(splitDataSiz[i]);
      rect(10 + int(splitData[i]) * 100, height/2, int(splitDataSiz[i]), int(splitDataSiz[i])*int(splitData[i]));
      fill(int(splitDataSiz[i])*int(splitData[i]),int(splitDataSiz[i]),int(splitDataSiz[i]));
    }
  
}

void draw() {

}
