class Level {
  String name;
  int number;
  int timePassed;
  int delay;
  int spawnDelay;
  color flc = color(random(50,120),random(50,120),random(50,120));
  Level(int number_) {
    number = number_;
    delay = 100;
    spawnDelay = 300;
    timePassed = 0;
    
    if(levelNumber > 0 ) {
      warp.play();
      warp.rewind();
    }
  }
  
  void update() {
    for(int i = 20; i < width-20; i+= 40)
      for(int j = 20; j < height - 20; j+=40) {
        //stroke(44, 62, 80);
        stroke(flc);
        strokeWeight(2);
        noFill();
        rectMode(CORNER);
        rect(i,j,40,40);
      }
      
    if(delay > 95 && delay < 100) {
      fill(255);
      rect(0,0,width,height); 
    }
    timePassed++;
    if(delay < 101) { 
      delay--;
      textSize(28);
      textAlign(CENTER);
      fill(255);
      textSize(18);
      text("get ready " + delay, 640, 420);
    }
      
    spawnDelay--;
    if(spawnDelay < 1 && levelNumber != 0) {
       spawners.add(new Spawner(round(random(50,1100)),round(random(50,660))));
       spawnDelay = 200;
    }
    
    if(delay < 1) {
          switch(number) {
      case 0:
        menu = new Menu();
        robots.add(new EnemyRobot(round(random(50,1100)),1000));
        break;
      case 1:
        name = "First Encounter";
        messages.add(new Message(name,width/2,height/2,32,0));
        populate(10,2,0,2,0,4,5); //robots, roamers, shooters, followers, tanks, mines, humans
        break;
     case 2:
        name = "Followed";
        messages.add(new Message(name,width/2,height/2,32,0));
        populate(5,0,0,10,0,3,5); //robots, roamers, shooters, followers, tanks, mines, humans
        break;
     case 3:
       name = "Roaming around";
       messages.add(new Message(name,width/2,height/2,32,0));
       populate(5,25,0,0,0,5,5); //robots, roamers, shooters, followers, tanks, mines, humans
       break;
     case 4:
       name = "Threatened";
       messages.add(new Message(name,width/2,height/2,32,0));
       populate(20,2,0,0,1,3,5); //robots, roamers, shooters, followers, tanks, mines, humans
       break;
     case 5:
       name = "Mayhem";
       messages.add(new Message(name,width/2,height/2,32,0));
       populate(20,10,2,5,0,5,5); //robots, roamers, shooters, followers, tanks, mines, humans
       break;
     case 6:
       name = "Surrounded";
       messages.add(new Message(name,width/2,height/2,32,0));
       populate(15,10,1,10,0,10,5); //robots, roamers, shooters, followers, tanks, mines, humans
       break;
     case 7:
       name = "Gauntlet";
       messages.add(new Message(name,width/2,height/2,32,0));
       populate(40,10,0,0,0,0,5); //robots, roamers, shooters, followers, tanks, mines, humans
       break;
     case 8:
       name = "Hang on";
       messages.add(new Message(name,width/2,height/2,32,0));
       populate(10,0,0,0,2,0,5); //robots, roamers, shooters, followers, tanks, mines, humans
       break;
     case 9:
       name = "Minefield";
       messages.add(new Message(name,width/2,height/2,32,0));
       populate(40,0,0,0,0,100,0); //robots, roamers, shooters, followers, tanks, mines, humans
       break;
     case 10:
       name = "Survival";
       messages.add(new Message(name,width/2,height/2,32,0));
       populate(30,15,2,10,0,10,0); //robots, roamers, shooters, followers, tanks, mines, humans
       break;
     case 11:
       name = "Don't Blink";
       messages.add(new Message(name,width/2,height/2,32,0));
       populate(40,0,2,0,1,5,0); //robots, roamers, shooters, followers, tanks, mines, humans
       break;
     case 12:
       name = "Vigilance";
       messages.add(new Message(name,width/2,height/2,32,0));
       populate(20,0,5,0,0,0,10); //robots, roamers, shooters, followers, tanks, mines, humans
       break;
     case 13:
       name = "Total Mayhem";
       messages.add(new Message(name,width/2,height/2,32,0));
       populate(20,30,0,10,0,10,0); //robots, roamers, shooters, followers, tanks, mines, humans
       break;
     case 14:
       name = "Trampled";
       messages.add(new Message(name,width/2,height/2,32,0));
       populate(20,0,0,0,3,0,0); //robots, roamers, shooters, followers, tanks, mines, humans
       break;
     case 15:
       name = "You Will Die";
       messages.add(new Message(name,width/2,height/2,32,0));
       populate(100,20,0,0,0,20,0); //robots, roamers, shooters, followers, tanks, mines, humans
       break;
     case 16:
       name = "You're Not Supposed To Be Here";
       messages.add(new Message(name,width/2,height/2,32,0));
       populate(50,20,5,0,0,10,0); //robots, roamers, shooters, followers, tanks, mines, humans
       break;
     case 17:
       name = "Under Fire";
       messages.add(new Message(name,width/2,height/2,32,0));
       populate(10,10,10,0,0,0,0); //robots, roamers, shooters, followers, tanks, mines, humans
       break;
     case 18:
       name = "Marked For Death";
       messages.add(new Message(name,width/2,height/2,32,0));
       populate(20,20,5,10,0,40,0); //robots, roamers, shooters, followers, tanks, mines, humans
       break;
     case 19:
       name = "Overwhelmed";
       messages.add(new Message(name,width/2,height/2,32,0));
       populate(30,20,10,10,2,50,0); //robots, roamers, shooters, followers, tanks, mines, humans
       break;
     case 20:
       name = "Hell";
       messages.add(new Message(name,width/2,height/2,32,0));
       populate(100,10,10,20,4,60,0); //robots, roamers, shooters, followers, tanks, mines, humans
       break;
     case 21:
       lives = -1;
       break;
    }
    delay = 1000;
    }
  }
  
  void populate(int a,int b,int c,int d,int e,int f,int g) {
        for(int i = 0; i < a; i++)
         robots.add(new EnemyRobot(round(random(50,1100)),round(random(50,660))));
        for(int i = 0; i < b; i++)
         robots.add(new RobotRoamer(round(random(50,1100)),round(random(50,660))));
        for(int i = 0; i < c; i++)
         robots.add(new RobotShooter(round(random(50,1100)),round(random(50,660))));
        for(int i = 0; i < d; i++)
         robots.add(new RobotFollower(round(random(50,1100)),round(random(50,660))));
        for(int i = 0; i < e; i++)
         robots.add(new RobotTank(round(random(50,1100)),round(random(50,600))));
        for(int i = 0; i < f; i++)
         robots.add(new RobotMine(round(random(50,1100)),round(random(50,660))));
        for(int i = 0; i < g; i++)
         humans.add(new Human(round(random(50,1100)),round(random(50,660))));
  }
}
  
