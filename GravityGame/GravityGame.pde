Player ball;
Ground floor;
Object obstacleRoof;
Object obstacleGround;

float d = 50;
float s = 5;
float p = 60;
float delay = 10;

void setup() {
  size(1000, 480);
  ball = new Player(d, s);
  floor = new Ground(p);
  obstacleGround = new Object(p, delay, false, (d/2));
  obstacleRoof = new Object(p, width/2, true, (d/2));
}

void draw() {
  background(36);
  translate(0, height/2);

  floor.show();
  obstacleRoof.show();
  obstacleGround.show();
  //ball.moveWithMouse();
  ball.move();
  ball.checkFatalCollision(obstacleGround);
  ball.checkFatalCollision(obstacleRoof);
  ball.checkCollision(floor);
  ball.score(obstacleGround, obstacleRoof);
  ball.show();
}

void keyPressed() {
  //println(keyCode);
  if (((keyCode == 38) || (keyCode == 40) || (keyCode == 32) || (keyCode == 81))) {
    if((keyCode == 32) && (ball.up == true || ball.down == false)){
      ball.k = 40;
    }else if((keyCode == 32) && (ball.down == true || ball.up == false)){
      ball.k = 38;
    }else{
      ball.k = keyCode;
    }
  }else if(keyCode == 37){
    ball.moveLeft();
  }else if(keyCode == 39){
    ball.moveRight();
  }
}