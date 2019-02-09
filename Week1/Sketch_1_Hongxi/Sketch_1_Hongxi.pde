//array of rectangle 
//when mouse clicked on different position, the color change 
//boolean array 

int[]myArray = {0, 30, 60, 90, 120, 150, 180, 210, 240, 270, 300, 330, 360, 390,420};
int[]mySecondArray = {0, 30, 60, 90, 120, 150, 180, 210, 240, 270, 300, 330, 360, 390,420};

                  
boolean rectcolor = false;
                     

void setup(){
  size(600,600);


}


void draw(){
    for(int i = 0; i < myArray.length; i ++){
      for (int j = 0; j< myArray.length; j ++){
      rect(myArray[i]*40, j*40, 40, 40);
      println(myArray[0]);
      
      if(mousePressed == true){
        fill(random(0,255),random(0,255),random(0,255));
      
      }
      
      }
      println(mouseX,mouseY);
    
    }
    



}
