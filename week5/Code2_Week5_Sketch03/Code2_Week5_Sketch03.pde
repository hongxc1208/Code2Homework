//particles
//3 states

particle p;
int num;


void setup(){

  size(600,600);
  p = new particle();
  
}


void draw(){
  background(255);
  p.display();
  p.update();
  p.changeScene();
  num = int(random(1,5));
  print(num);
  
  fill(0);
  textSize(30);
  text("Press number to change state", 100, 100);
  text("state:" + p.state, 100, 200);

}

class particle{
  int state;
  PVector pos;
  float radius;

  
  particle(){
    pos = new PVector(300, 300);
    radius = 50;
  }
  
  
  
  void display(){
    switch(state){
      case 0:
      fill(0);
      break;
      case 1:
      break;
      case 2:
      fill(random(255),0,0);
      break;
      case 3:
      fill(random(255),0,0);
      radius += int(random(-5, 5));
      
    }
   
   ellipse(pos.x, pos.y, radius, radius);

  }
  
  void update(){
    switch (state) {
      case 0:
        break;
      case 1:
        if (num == 1){
          pos. x += 5;
        } if (num == 2){
          pos. x -= 5;
        } if(num == 3){
          pos. y += 5;
        } if (num == 4){
          pos. y -= 5;
        }
        break;
      case 2:
        if (num == 1){
          pos. x += 5;
        } if (num == 2){
          pos. x -= 5;
        } if(num == 3){
          pos. y += 5;
        } if (num == 4){
          pos. y -= 5;
        }
        break;
      case 3:
        if (num == 1){
          pos. x += 5;
        } if (num == 2){
          pos. x -= 5;
        } if(num == 3){
          pos. y += 5;
        } if (num == 4){
          pos. y -= 5;
        }
        break;
      default:
        break;
    }
  }
  
  
  void changeScene() {

    switch (state) {
      case 0:
        if (keyCode == '1' ) {
          println("change");
          state = 1;
        }
        break;
      case 1:
        if(keyCode == '2'){
          state = 2;
        }
        break;
       case 2:
       if(keyCode == '3'){
          state = 3;
       }
       default:
        break;
    }
  }

}
