// state = screen
// text to display for each screen   (state representation)
// options to choose for each screen (state transitions)

// string for each text
// string for each option - corresponds to a keypress

int state = 0;
PImage sneaker;
int num = 0;
boolean shoespurchased = false;

JSONObject data;
JSONArray json;
String[] descip;
String[][] op;


String[] descriptions = {
  "You're a sneakerhead, walking in a shopping mall, you found there is a sneaker shop infront of you",
  "There are many sneakers display in the store",
  "You look on fire with the sneaker"
};

String[][] options = {
  {"Walking into the shop"},
  {"Try on the latest released sneaker", "Walk out the store"},
  {"Buy the sneaker and leave"}
};

int[][] optionTargets = {
  {1},
  {2, 0},
  {0},
};


color[]background = {
  color(66, 134, 244), color(146, 242, 62), color(244, 217, 66)
};

Scene[] scenes = new Scene[descriptions.length];


void setup() {
  size(600, 600);
  sneaker = loadImage("sneaker.png");
  data = loadJSONObject("data.json");
  
  
  for(int i = 0; i < data.size(); i++){
    JSONArray descriptionData = data.getJSONArray("descriptions");
    JSONArray optionsData = data.getJSONArray("options");
    descip = descriptionData.getStringArray();
    op[i] = optionsData.getStringArray();
    

  }
  

  for (int i = 0; i < scenes.length; i++) {
    scenes[i] = new Scene(descip[i], op[i], optionTargets[i],background[i]);
  }
}

void draw() {
  for (int i = 0; i < scenes.length; i++) {
    background(background[state]);
  }
  //println(num);
  
  drawshoes();
  textSize(40);
  fill(0);
  text(scenes[state].displayText, 40, 40, 450, 300);
  textSize(24);
  
  int i = 0;
  for (String option : scenes[state].options) {
    text(option, 40, 450 + i * 50);
    i++;
  }
  
  textSize(30);
  text(num, 500, 550);
}

void drawshoes(){
   if(shoespurchased == true){
      sneaker.resize(0,150);
      image(sneaker, 400, 400);
   }
}

void keyPressed() {  
  for (int i = 0; i < scenes[state].options.length; i++) {
    if (keyCode - 49 == i) {
       state = scenes[state].optionTargets[i];
    }
    
    if(state == 2 && keyCode == 49){
      shoespurchased = true;
      num = num + 1; 
    }
  }
}


class Scene {
  String displayText;
  String[] options;
  int[] optionTargets;
  color background;
  
  Scene(String txt, String[] opt, int[] targets, color backgroundcolor) {
    displayText = txt;
    options = opt;
    optionTargets = targets;
    background = backgroundcolor;
  }
}
