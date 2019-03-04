// bryan ma for code 2 sp 19 A

Player player;
Ball ball;
Brick[][] bricks = new Brick[10][5];
Table data;
PVector [][] level = new PVector[10][5];
int w;
int h;
int rows = 10;
int cols = 5;

boolean rightPressed = false;
boolean leftPressed = false;

void setup() {
  w = 20;
  h = 80;
  size(900, 600);
  data = loadTable("data.csv");
  player = new Player();
  ball = new Ball();
    
  for(int i = 0; i < data.getRowCount(); i++){
    for(int j = 0; j < data.getRowCount(); j ++){
     TableRow row = data.getRow(i);
     int x = row.getInt(j);
     level[i][j] = new PVector (x *h , x *w);
    
    print(level[i][j].x);
    }
  
  }


  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
     
        bricks[i][j] = new Brick(5 + i * 90, 50 + j * 40, h, w);

      }
    
  }
}

void draw() {
  background(10);
  player.update();
  player.display();

  ball.update();
  ball.display();

  if (ball.pos.x > player.x - player.w/2 && ball.pos.x < player.x + player.w/2 &&
    ball.pos.y > player.y - player.h/2 && ball.pos.y < player.y + player.h/2) {
      
    ball.angle = random(PI, TWO_PI);
    ball.vel = new PVector(cos(ball.angle), sin(ball.angle));
    ball.vel.mult(ball.speed);
    ball.pos.add(ball.vel);
  }

  for (int i = 0; i < bricks.length; i++) {
    for (int j = 0; j < bricks[0].length; j++) {
      if (bricks[i][j].active) {
        bricks[i][j].display();
        if (ball.didCollideWithBrick(bricks[i][j])) {
          bricks[i][j].active = false;
        }
      }
    }
  }
}
