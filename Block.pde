class Block {
  int x,y,xsize,ysize;
  int x1,x2,y1,y2;
  
  Block(int x_, int y_, int xsize_, int ysize_) {
    x = x_;
    y = y_;
    xsize = xsize_;
    ysize = ysize_;
  }
  
  void display() {
   fill(10,0);
   noStroke();
   rectMode(CORNER);
   rect(x,y,xsize,ysize);
   
   x1 = x;
   x2 = x+xsize;
   y1 = y;
   y2 = y+ysize;
  }
}
