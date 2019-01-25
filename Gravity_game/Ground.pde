class Ground{
  
  float y = 0;
  
  Ground(float percent){
    percent /= 2;
    y = height*(percent/100);
  }
  
  void show(){
    //stroke(255);
    //strokeWeight(5);
    noStroke();
    fill(0, 100);
    rect(0, y, width, (height/2)-y);
    rect(0, -y, width, (-height/2)+y);
  }
}