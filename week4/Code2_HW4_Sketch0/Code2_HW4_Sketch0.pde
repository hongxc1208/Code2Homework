// bryan ma for code 2 sp 19 A
//Create a array of objects;
//Each class should have a constructor that takes the value stored in string as an argument;
//myObjects[i] = new myObject(splitData[i]);



String[] data;
Rect r;


void setup() {
  data = loadStrings("dataPos.txt");
  
  size(600, 600);
  String[] splitData = data[0].split(",");
  String[] splitDataSiz = data[1].split(",");
  
  for (int i = 0; i < splitData.length; i++) {
      r = new Rect(int(splitData[i]), int(splitDataSiz[i]));
      r.display();
      println(r);
      
    }
  
}

void draw() {
  
}


  
