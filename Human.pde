class Human {
  int speed = 1;
  PVector location;
  PVector velocity;
  
  float x1,y1,x2,y2;
  
  int myLife = 1;
  int size = 15;
  
  Human(int x_, int y_) {
    location = new PVector(x_,y_);
    velocity = PVector.random2D();
    velocity.normalize();
    velocity.mult(speed);
  }
  
  void display() {
    
    fill(0,0);
    stroke(241, 196, 15);
    strokeWeight(2);
    
    pushMatrix();
    translate(location.x, location.y);
    rotate(frameCount % 75);
    polygon(0, 0, size, 7); 
    popMatrix();
    
    fill(243, 156, 18);
    noStroke();
    ellipseMode(RADIUS);
    ellipse(location.x, location.y, size/1.5, size/1.5);
    
    x1 = location.x - size;
    x2 = location.x + size;
    y1 = location.y - size;
    y2 = location.y + size;
  }
  
  void update() {
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
