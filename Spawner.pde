class Spawner {
  int x,y,delay;
 
  Spawner(int x_, int y_) {
   x = x_;
   y = y_;
   delay = 120;
  }
 
  void display() {
    noFill();
    strokeWeight(2);
    stroke(255,0,0);
    ellipseMode(CENTER);
    arc(x,y,30,30,0,radians(delay*3));
    delay--;
  } 
}
