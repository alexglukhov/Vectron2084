class RobotMine extends EnemyRobot {
  
  RobotMine(int x_, int y_) {
    super(x_, y_);
  
    myLife = 5;
    velocity = new PVector(0,0);
    speed = 0;
  }
  
  void display() {
    fill(231, 76, 60);
    noStroke();
    ellipseMode(RADIUS);
    ellipse(location.x, location.y, size/3, size/3);
    
    fill(0,0);
    stroke(255);
    strokeWeight(2);
    pushMatrix();
    translate(location.x, location.y);
    rotate(frameCount / -100.0);
    polygon(0, 0, size, 6); 
    popMatrix();
    
    x1 = location.x - size;
    x2 = location.x + size;
    y1 = location.y - size;
    y2 = location.y + size;
  }
}
