class EnemyRobot {
  float speed = 2;
  PVector location;
  PVector velocity;
  int size = 20;
  float xprevious, yprevious;
  int worth;
  
  float x1,y1,x2,y2;
  
  int myLife = 1;
  
  EnemyRobot(int x_, int y_) {
    xprevious = x_;
    yprevious = y_;
    location = new PVector(x_,y_);
    velocity = PVector.random2D();
    velocity.normalize();
    velocity.mult(speed);
    worth = 100;
  }
  
  void display() {
    fill(0,0);
    stroke(46, 204, 113);
    strokeWeight(2);
    pushMatrix();
    translate(location.x, location.y);
    rotate(frameCount / -100.0);
    polygon(0, 0, size, 5); 
    popMatrix();
    
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
  
  PVector getLocation() {
    return location; 
  }
  
  void checkBounds() {
     if(location.x < 0 || location.x > width)
       velocity.x = -velocity.x;
       
     if(location.y < 0 || location.y > height)
       velocity.y = -velocity.y;
  }
}
