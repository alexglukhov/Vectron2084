class Message {
  String mText;
  float x,y,size;
  int toDie = 150;
  float vspeed;
  
  Message(String text_, float x_, float y_, float size_, int vspeed_) {
    mText = text_;
    size = size_;
    x = x_;
    y = y_;
    vspeed = vspeed_;
  }
  
  void display() {
    fill(255);
    textSize(size);
    textAlign(CENTER);
    text(mText,x,y);
    toDie--;
    y -= vspeed;
    if(vspeed > 0.01)
      vspeed -= 0.01;
  }
}
