class RobotTank extends EnemyRobot {
  int shootDelay;
  
  RobotTank(int x_, int y_) {
    super(x_, y_);
    
    myLife = 25;
    speed = 2;
    shootDelay = 10;
    size = 50;
    worth = 1000;
  }
  
  void display() {
    fill(0,0);
    stroke(231, 76, 60);
    strokeWeight(2);
    
    pushMatrix();
    translate(location.x, location.y);
    rotate(frameCount / -100.0);
    polygon(0, 0, size, 5); 
    popMatrix();
    
    fill(231, 76, 60);
    
    pushMatrix();
    translate(location.x, location.y);
    rotate(frameCount / 50.0);
    polygon(0, 0, size/2, 5); 
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
      shootDelay = 40+round(random(40)); 
    }
    xprevious = location.x;
    yprevious = location.y;
    location.add(velocity);
  }
}
