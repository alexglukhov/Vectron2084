class Menu {
  color flc = color(255);
  
  Menu(){
    player = null;
  }
  
  void display() {
   fill(flc);
    textAlign(CENTER);
    textSize(32);
    text("Vectron 2084", 640,360);
    textSize(18);
    text("press space to start!", 640,420);
    textAlign(LEFT);
    textSize(14);
    text("A Game By Alexey Glukhov", 20, 700);
    if(isSpacePressed) {
      robots = new ArrayList<EnemyRobot>();
      flc = color(255,0);
    }
  }
}
