class Object {
  float x, y, w, h;
  float l, u, r, d;
  float speed;
  float spacing;
  float del;
  int difficulty = 1;
  boolean roof;
  
  int objs_passed = -1;

  Object(float percent, float delay, boolean roof, float spacing) {
    percent /= 2;
    del = delay;
    x = width + del;
    //x = width/2;
    y = height*(percent/100);
    this.roof = roof;
    this.spacing = spacing;
    reset();
  }

  void show() {
    noStroke();
    fill(240);
    if (roof == true) {
      rect(x, -y, w, -h);
    } else {
      rect(x, y, w, h);
    }
    x -= speed;
    
    l = x;
    u = y;
    r = x+w;
    d = y+h;
    
    if (r < 0) {
      x = width;
      reset();
    }
  }

  void reset() {
    speed = random(TWO_PI, difficulty*TWO_PI);
    w = random(50, width/3);
    h = random(-y + spacing, -50);
    
    objs_passed ++;
    
    if(objs_passed == 25){
      difficulty ++;
    }
  }
}