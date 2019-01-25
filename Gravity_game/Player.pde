class Player {

  boolean up = false, right = false, down = false, left = false;
  boolean f_collision[] = new boolean[2];

  float size;
  float r;
  float x = 0;
  float y = 0;
  float speed = 0;
  float speed_lv2 = 0;

  int[] rgb = {200, 200, 200};

  Player(float d, float s) {
    size = d;
    r = d/2;
    x = r+100;
    y = height;
    if (y > 0) {
      down = true;
    }
    speed = s;
    speed_lv2 = (s*2)-PI;
  }

  void show() {
    //stroke(255);
    //strokeWeight(2);
    noStroke();
    fill(rgb[0], rgb[1], rgb[2]);
    ellipse(x, y, size, size);
  }

  void moveWithMouse() {
    x = mouseX;
    y = mouseY - height/2;
    //println("x: "+x + " | y: "+y);
  }

  void checkCollision(Ground floor) {
    if (y+r >= floor.y) {
      y = floor.y - r;
    } else if ((y-r <= -floor.y)) {
      y = -floor.y + r;
    }
  }

  void checkFatalCollision(Object obj) {
    if (obj.roof == false) {
      if ((x+r > obj.l && y+r > obj.y+obj.h && x-r < obj.r)) {
        f_collision[0] = true;
      } else {
        f_collision[0] = false;
      }
    } else {
      if ((x+r > obj.l && (y-r < -(obj.y+obj.h)) && x-r < obj.r)) {
        f_collision[1] = true;
      } else {
        f_collision[1] = false;
      }
    }
    if (f_collision[0] == true || f_collision[1] == true) {
      reset(obj);
    }
  }

  void moveUp() {
    k = 38;
    up = true;
    down = false;
    y -= speed;
  }

  void moveDown() {
    k = 40;
    down = true;
    up = false;
    y += speed;
  }

  void moveLeft() {
    left = true;
    right = false;
    x -= speed*2.5;
  }

  void moveRight() {
    right = true;
    left = false;
    x += speed*2.5;
  }

  int k = 0;

  void move() {
    switch(k) {
    case 38:
      {
        moveUp();
        break;
      }
    case 40:
      {
        moveDown();
        break;
      }
    }
  }
  
  int score;
  
  void score(Object obj1, Object obj2) {
    score = obj1.objs_passed + obj2.objs_passed;
    //println(score);
    if(obj1.difficulty == 2 && obj2.difficulty == 2){
      speed = speed_lv2;
    }
    textSize(32);
    text("Score: " + score, (width/2)-60, -(height/2)+50);
  }
  
  void reset(Object obj){
    speed = (speed_lv2+PI)/2;
    obj.x = width*2 + obj.del;
    obj.objs_passed = -1;
    obj.difficulty = 1;
    obj.reset();
    score = 0;
    k = 0;
    x = r+100;
    y = height;
  }
}