class RobotShooter extends EnemyRobot {
  int shootDelay;
  
  RobotShooter(int x_, int y_) {
    super(x_, y_);
    
    myLife = 2;
    speed = 2;
    shootDelay = 30;
    worth = 150;
  }
  
  void display() {
    fill(0,0);
    stroke(192, 57, 43);
    strokeWeight(2);
    pushMatrix();
    translate(location.x, location.y);
    rotate(frameCount / -100.0);
    polygon(0, 0, frameCount % size, 7); 
    popMatrix();
    
    x1 = location.x - size;
    x2 = location.x + size;
    y1 = location.y - size;
    y2 = location.y + size;
  }
  
  void update() {
    shootDelay -= 1;
    
    if(shootDelay < 1) {
      bullets.add(new EnemyBullet(location.x, location.y, 10));
      shootDelay = 80+round(random(40)); 
    }
    xprevious = location.x;
    yprevious = location.y;
    location.add(velocity);
  }
}
