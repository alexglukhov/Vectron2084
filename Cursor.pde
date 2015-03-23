class Cursor {
  PVector location;
  
  Cursor() {
    location = new PVector(mouseX, mouseY);
  }
  
  void display() {
    fill(255);
    stroke(255);
    line(location.x,location.y-20,location.x,location.y+20);
    line(location.x-20,location.y,location.x+20,location.y);
  }
  
  void update() {
    location = new PVector(mouseX, mouseY);
  }
  
  PVector getLocation() {
    return location; 
  }
}
