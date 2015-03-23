class EnemyBullet extends Bullet {
  
  EnemyBullet(float x_, float y_, int speed_) {
    super(x_, y_, speed_);
    if(player != null)
      velocity = PVector.sub(player.getLocation(), location);
    else
      velocity = new PVector(1,0);
    velocity.normalize();
    velocity.mult(speed);
    
    enemyControlled = true;
  }
  
  void display() {
    stroke(192, 57, 43);
    strokeWeight(3);
    line(location.x, location.y, xprevious, yprevious);
    
    x1 = location.x - size;
    x2 = location.x + size;
    y1 = location.y - size;
    y2 = location.y + size;
  }
  
  boolean checkBounds() {
     if(location.x < 0 || location.x > width || location.y < 0 || location.y > height)
       return true;
     return false;
  }
}
