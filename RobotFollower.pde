class RobotFollower extends EnemyRobot {
  
  RobotFollower(int x_, int y_) {
    super(x_, y_);
    
    velocity = PVector.sub(cursor.getLocation(), location);
    velocity.normalize();
    velocity.mult(speed);
    
    myLife = 2;
    speed = 2+random(2);
  }
  
  void display() {
    fill(0,0);
    stroke(0,255,255);
    strokeWeight(2);
    pushMatrix();
    translate(location.x, location.y);
    rotate(frameCount / -100.0);
    polygon(0, 0, size, frameCount % size + 4); 
    popMatrix();
    
    x1 = location.x - size;
    x2 = location.x + size;
    y1 = location.y - size;
    y2 = location.y + size;
  }
  
  void update() {
    if(player != null) {
      velocity = PVector.sub(player.getLocation(), location);
      velocity.normalize();
      velocity.mult(speed);
    }
    else
      velocity = new PVector(0,speed);
    
    xprevious = location.x;
    yprevious = location.y;
    location.add(velocity);
  }
}
