int [] CircleNumb;
int [] CirclePosition = {80, 200, 320, 440};
int Number;
String [] Text = new String[4];





void setup(){
  size(600,500);
 
  
  CircleNumb= new int[4];
  CircleNumb[0] = 0;
  CircleNumb[1] = 1;
  CircleNumb[2] = 2;
  CircleNumb[3] = 3;
  Text[0] = "Inspirational Quotes";
  Text[1] = "So Inspirational";
  Text[2] = "don't you feel so inspired";
  Text[3] = "Motivating quotes are so motivating";

 println(CircleNumb);
 println(CirclePosition);
 
}


void draw(){
  background(255);
  textSize(30);

  
 
  for(int i = 0; i < CirclePosition.length; i++){
    ellipse(CirclePosition[i], 100, 80, 80);
    
    fill(0);
    
    if(dist(mouseX, mouseY, CirclePosition[i], 100) < 40 && mousePressed == true){
     text(Text[i],CENTER,400);
     //println("working");
     fill(255);
     println(CirclePosition[i]);
    } else{
    fill(0);
    
    }


  }

}
