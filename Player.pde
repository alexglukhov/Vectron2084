class Player {
  int playerSpeed = 6;
  PVector location;
  float x1,y1,x2,y2;
  int size = 15;
  int shootDelay = 10;
  int shieldTimer = 200;
  
  Player(int x_, int y_) {
    location = new PVector(x_,y_);
  }
  
  void display() {
    fill(0,0);
    stroke(255);
    strokeWeight(2);
    
    pushMatrix();
    translate(location.x, location.y);
    rotate(atan2(cursor.location.x,cursor.location.y));
    polygon(0, 0, size, 5); 
    popMatrix();
    if(shieldTimer > 1) {
       noStroke();
       fill(50,230,50,100);
       ellipseMode(RADIUS);
       ellipse(location.x, location.y, size*2, size*2);
    }  
  }
  
  void update() {
    explosions.add(new Explosion(location.x, location.y, size/2, 3));
    
    // move around if arrow keys are pressed
    if (isRightPressed) location.x += playerSpeed;
    if (isLeftPressed)  location.x -= playerSpeed;
    if (isUpPressed)    location.y -= playerSpeed;
    if (isDownPressed)  location.y += playerSpeed;
    
    x1 = location.x - size;
    x2 = location.x + size;
    y1 = location.y - size;
    y2 = location.y + size;
    
    shootDelay--;
    shieldTimer--;
  }
  
  PVector getLocation() {
    return location; 
  }
}
