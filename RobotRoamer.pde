class RobotRoamer extends EnemyRobot {
  int switchDelay;
  int direction;
  
  RobotRoamer(int x_, int y_) {
    super(x_, y_);
    
    myLife = 2;
    speed = 3+random(2);
    switchDelay = 100;
    assignDirection();
    worth = 150;
  }
  
  void display() {
    fill(0,0);
    stroke(26, 188, 156);
    strokeWeight(2);
    pushMatrix();
    translate(location.x, location.y);
    rotate(frameCount / -50.0);
    polygon(0, 0, size, 4); 
    popMatrix();
    
    x1 = location.x - size;
    x2 = location.x + size;
    y1 = location.y - size;
    y2 = location.y + size;
  }
  
  void update() {
    explosions.add(new Explosion(location.x, location.y, size/3, 4));
    switchDelay -= 1;
    
    if(switchDelay < 1) {
      assignDirection();
      switchDelay = 100+round(random(40)); 
    }
    
    xprevious = location.x;
    yprevious = location.y;
    location.add(velocity);
  }
  
  void assignDirection() {
    direction = round(random(1,4));
    switch(direction) {
      case 1:
        velocity = new PVector(speed,0);
        break;
      case 2:
        velocity = new PVector(0,speed);
        break;
      case 3: 
        velocity = new PVector(-speed,0);
        break;
      case 4:
        velocity = new PVector(0,-speed);
        break;
    }
  }
}
