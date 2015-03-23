class Bullet {
  float x,y,speed,xprevious,yprevious;
  PVector location;
  PVector velocity;
  float x1,y1,x2,y2;
  boolean enemyControlled;
  int size = 7;
  
  Bullet(float x_, float y_, int speed_) {
    x = x_;
    y = y_;
    speed = speed_;
    location = new PVector(x,y);
    enemyControlled = false;
    xprevious = x_;
    yprevious = y_;
    velocity = PVector.sub(cursor.getLocation(), location);
    velocity.normalize();
    velocity.mult(speed);
  }
  
  void display() {
    stroke(241, 196, 15);
    strokeWeight(3);
    line(location.x, location.y, xprevious, yprevious);
    
    x1 = location.x - size;
    x2 = location.x + size;
    y1 = location.y - size;
    y2 = location.y + size;
  }
  
  void update() {
    xprevious = location.x;
    yprevious = location.y;
    location.add(velocity);
  }
  
  boolean checkBounds() {
     if(location.x < 0 || location.x > width || location.y < 0 || location.y > height)
       return true;
     return false;
  }
}
