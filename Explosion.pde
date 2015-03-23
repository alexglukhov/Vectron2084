class Explosion {
  float x,y,x1,y1,x2,y2;
  float size = 50; //default size
  int size2 = 50;
  int xnew, ynew;
  int hspeed = round(random(-3, 3));
  int vspeed = round(random(-3, 3));
  int type;

  Explosion(float tx, float ty, int tsize, int ttype) {
    x = tx;
    y = ty;
    size = tsize;
    size2 = tsize;
    type = ttype;
  }

  void display() {
    strokeWeight(2);
    switch(type) {
    
    //type 1 = white explosion with blast, type 2 = when player bullet hits enemy/asteroid, type 3 = small white explosion, no blast
    case 1:
      size -= 3;
      size2 += 1;
      ellipseMode(CENTER);
      stroke(255); 
      fill(255);
      ellipse(x, y, size, size);
      fill(0, 0);
      ellipse(x, y, size2, size2);
      break;
    case 2:
      size-= 2;
      noStroke();
      ellipseMode(CENTER);
      fill(241, 196, 15);
      ellipse(x, y, size, size);
      break;
    case 3:
      size-= 0.2;
      noStroke();
      ellipseMode(CENTER);
      fill(241, 196, 15);
      ellipse(x, y, size, size);
      break;
    case 4:
      size-= 0.1;
      noStroke();
      rectMode(CENTER);
      fill(22, 160, 133);
      rect(x, y, size, size);
      break;
    }
    x1 = x - size;
    x2 = x + size;
    y1 = y - size;
    y2 = y + size;
  }
}
