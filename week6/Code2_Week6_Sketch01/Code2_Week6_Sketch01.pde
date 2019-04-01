//an ellipse game, 
//positive treatment --> growing bigger and colorful 
//negative treatment --> growing smaller and disappear 

//Array string of descriptions
//Array string of options
//int of optionTargets
//int of radius size 
int state = 0;

String[] descriptions = {
  "Ellipse Game",
  "The ellipse change based on your treatment",
  "This is your final ellipse",
  "This is your final ellipse"
};

String[][] options = {
  {"Tell it a joke", "Hit it with a rock" },
  {"feed it ice-cream", "throw it to the ground"},
  {"play again"},
  {"play again"}
};

int[][] optionTargets = {
  {1, 1},
  {2, 3},
  {0},
  {0}
};

float[][]radius = {
  {50, 50},
  {70, 30},
  {90},
  {10}
};

Scene[] scenes = new Scene[descriptions.length];

void setup(){
  size(600,600);
  for(int i = 0; i < scenes.length; i ++){
    scenes[i] = new Scene(descriptions[i], options[i], optionTargets[i], radius[i]);
  }
}

void draw(){
  background(255);
  textSize(30);
  fill(0);
  text(scenes[state].displayText, 40, 50, 450, 300);
  textSize(24);
  
  int i = 0;
  for(String option: scenes[state].options){
    text(option, 40, 450 + i * 50);
    i ++;
  }
  
  for(int j = 0; j < 2; j++){
     println(radius[state]);
  
  }
  

}

void keyPressed(){
  for(int i = 0; i < scenes[state].options.length; i ++){ // i smaller than scenes[state]中option的长度，如果length是2，i < 2
    if(keyCode - 49 == i){ //保证按下的keycode是1，2这两个数字，1是49，2是50。
      state = scenes[state].optionTargets[i]; //一共有3个state，每次按1或者2就会跳转到另一个state，according to the option number in optionTargets
    }
  }
}


//void ellipseShape(){
//  for(int i = 0; i < scenes[state].radius.length; i++){
//    println(radius[i]);
  
//  }

//}

class Scene{
  String displayText;
  String[] options;
  int[] optionTargets;
  float[]radius;
  
  Scene(String txt, String[] opt, int[] targets, float[]radius){
    displayText = txt;
    options = opt;
    optionTargets = targets;
    radius = radius;
  }
}
