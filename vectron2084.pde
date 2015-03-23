//I am not a robot. I have a heart and I bleed.

//Vectron 2084 by Alexey Glukhov

// WARNING WARNING WARNING 
// this code is largely uncommented due to the fact..
// ..that this was made in a short period of time. Sorry!

// Feel free to modify and distribute, with credit to the original creator.

//IMPORT MINIM LIBRARY AND DEFINE GAME SOUNDS
import ddf.minim.*;
Minim minim;
//AudioPlayer song1;
AudioPlayer shoot;
AudioPlayer died;
AudioPlayer revived;
AudioPlayer smallExp;
AudioPlayer largeExp;
AudioPlayer collect;
AudioPlayer warp;

// booleans for keypresses to allow multiple keys to be pressed at once
boolean isUpPressed = false;
boolean isDownPressed = false;
boolean isLeftPressed = false;
boolean isRightPressed = false;
boolean isSpacePressed = false;
boolean paused = false;

int score = 0;
int lives = 10;
int respawnDelay = 100;
int finishDelay;

Cursor cursor = new Cursor();
Player player;
Level level;

int levelNumber = 0;
boolean mousePress = false;

PFont font;

Menu menu;

ArrayList<Bullet> bullets;
ArrayList<EnemyRobot> robots;
ArrayList<Human> humans;
ArrayList<Block> blocks;
ArrayList<Message> messages;
ArrayList<Explosion> explosions;
ArrayList<Spawner> spawners;

void setup() {
  //ASSIGN SOUND FILES TO MINIM
  minim = new Minim(this);
  //song1 = minim.loadFile("data/bgmusic.mp3");
  shoot = minim.loadFile("data/laser.wav");
  died = minim.loadFile("data/die.wav");
  revived = minim.loadFile("data/revive.wav");
  smallExp = minim.loadFile("data/explosion.wav");
  largeExp = minim.loadFile("data/largeexp.wav");
  collect = minim.loadFile("data/collect.wav");
  warp = minim.loadFile("data/warp.wav");
  
  size(1280,720);
  frameRate(60);
  noCursor();
  font = loadFont("SquareOne.vlw");
  textFont(font,16);
  level = new Level(levelNumber);
  bullets = new ArrayList<Bullet>();
    robots = new ArrayList<EnemyRobot>();
    humans = new ArrayList<Human>();
    blocks = new ArrayList<Block>();
    messages = new ArrayList<Message>();
    explosions = new ArrayList<Explosion>();
    spawners = new ArrayList<Spawner>();
  if(levelNumber > 0) {
    player = new Player(640,360);
    blocks.add(new Block(0,0,30,height));
    blocks.add(new Block(0,0,width,20));
    blocks.add(new Block(width-20,0,20,height));
    blocks.add(new Block(0,height-20,width,20));
    finishDelay = 150;
  }
  
  if(levelNumber == 1) {
    //song1.loop(); 
  }
}

void draw() {
  background(10);
  level.update();
  
  if(menu != null)
    menu.display();
  
  cursor.display();
  cursor.update();
  
  for (int i = 0; i < blocks.size(); i++) {
    Block b = blocks.get(i);
    b.display();
    
    if(player != null && collide(b.x1,b.y1,b.x2,b.y2,player.x1,player.y1,player.x2,player.y2)) {
        if(player.location.x < b.x1) {
          player.location.x = b.x1 - 21;
        }
      
        if(player.location.x > b.x2) {
          player.location.x = b.x2 + 21;
        }
      
        if(player.location.y < b.y1) {
          player.location.y = b.y1 - 21;
        }
      
        if(player.location.y > b.y2) {
          player.location.y = b.y2 + 21;
        } 
      }
  }
  
  for (int i = 0; i < bullets.size(); i++) {
    Bullet b = bullets.get(i);
    b.display();
    b.update();
    
    if(player != null && b.enemyControlled && collide(b.x1,b.y1,b.x2,b.y2,player.x1,player.y1,player.x2,player.y2)) {
        if(player.shieldTimer < 1) {
          messages.add(new Message("terminated!",player.location.x,player.location.y,16,1));
          lives--;
          player = null;
        }
        else
          bullets.remove(i);
      }
    
    if(b.checkBounds())
      bullets.remove(i);
  }
  
  for (int i = 0; i < humans.size(); i++) {
    Human h = humans.get(i);
    h.display();
    h.update();
    h.checkBounds();
    
    if(player != null && collide(h.x1,h.y1,h.x2,h.y2,player.x1,player.y1,player.x2,player.y2)) {
        messages.add(new Message("500",h.location.x,h.location.y,16,1));
        humans.remove(i);
        score += 500;
        collect.play();
        collect.rewind();
      }
      
    for (int k = 0; k < robots.size(); k++) {
        EnemyRobot r = robots.get(k);
    
      if(collide(h.x1,h.y1,h.x2,h.y2,r.x1,r.y1,r.x2,r.y2)) {
        h.myLife -= 1;
      }
    }
    
    for (int j = 0; j < bullets.size(); j++) {
      Bullet b = bullets.get(j);
    
      if(collide(b.x1,b.y1,b.x2,b.y2,h.x1,h.y1,h.x2,h.y2)) {
        bullets.remove(j);
        h.myLife -= 1;  
      }
   }
    
    for (int j = 0; j < blocks.size(); j++) {
      Block b = blocks.get(j);
      if(collide(b.x1,b.y1,b.x2,b.y2,h.x1,h.y1,h.x2,h.y2)) {
        if(h.location.x < b.x1) {
          h.velocity.x *= -1;
          h.location.x = b.x1 - 21;
        }
      
        if(h.location.x > b.x2) {
          h.velocity.x *= -1;
          h.location.x = b.x2 + 21;
        }
      
        if(h.location.y < b.y1) {
          h.velocity.y *= -1;
          h.location.y = b.y1 - 21;
        }
      
        if(h.location.y > b.y2) {
          h.velocity.y *= -1;
          h.location.y = b.y2 + 21;
        } 
      }
    }
    
    if(h.myLife < 1) {
      messages.add(new Message("-200",h.location.x,h.location.y,16,1));
      humans.remove(i);
      score -= 200;
    }
  }
  
  for (int i = 0; i < robots.size(); i++) {
    EnemyRobot r = robots.get(i);
    r.display();
    r.update();
    r.checkBounds();
    
    if(player != null && collide(r.x1,r.y1,r.x2,r.y2,player.x1,player.y1,player.x2,player.y2)) {
        if(player.shieldTimer < 1) {
          messages.add(new Message("terminated!",player.location.x,player.location.y,16,1));
          lives--;
          player = null;
        }
        robots.remove(i);
        smallExp.play();
        smallExp.rewind();
    }
    
    for (int j = 0; j < bullets.size(); j++) {
      Bullet b = bullets.get(j);
    
      if(collide(b.x1,b.y1,b.x2,b.y2,r.x1,r.y1,r.x2,r.y2) && !b.enemyControlled) {
        explosions.add(new Explosion(b.location.x, b.location.y, 20, 2));
        bullets.remove(j);
        r.myLife -= 1;  
      }
    }
    
    for (int j = 0; j < humans.size(); j++) {
      Human h = humans.get(j);
    
      if(collide(h.x1,h.y1,h.x2,h.y2,r.x1,r.y1,r.x2,r.y2) && r.speed == 0) {
        explosions.add(new Explosion(r.location.x, r.location.y, r.size*5, 1));
        r.myLife -= 99;  
      }
    }
    
    for (int j = 0; j < explosions.size(); j++) {
      Explosion e = explosions.get(j);
    
      if(collide(e.x1,e.y1,e.x2,e.y2,r.x1,r.y1,r.x2,r.y2) && r.speed == 0 && e.type == 1) {
        explosions.add(new Explosion(r.location.x, r.location.y, 20, 2));
        r.myLife -= 1;  
      }
    }
    
    for (int j = 0; j < blocks.size(); j++) {
      Block b = blocks.get(j);
      
      if(collide(b.x1,b.y1,b.x2,b.y2,r.x1,r.y1,r.x2,r.y2)) {
        if(r.location.x < b.x1) {
          r.velocity.x *= -1;
          r.location.x = b.x1 - r.size-1;
        }
      
        if(r.location.x > b.x2) {
          r.velocity.x *= -1;
          r.location.x = b.x2 + r.size+1;
        }
      
        if(r.location.y < b.y1) {
          r.velocity.y *= -1;
          r.location.y = b.y1 - r.size-1;
        }
      
        if(r.location.y > b.y2) {
          r.velocity.y *= -1;
          r.location.y = b.y2 + r.size+1;
        } 
      }
    }
    
      if(r.myLife < 1) {
        score += r.worth;
        messages.add(new Message(str(r.worth),r.location.x,r.location.y,16,1));
        explosions.add(new Explosion(r.location.x, r.location.y, r.size*5, 1));
        if(r.size < 30) {
          smallExp.play();
          smallExp.rewind();
        }
        else {
          largeExp.play();
          largeExp.rewind();
        }
        robots.remove(i);
      }
    }
  
  for (int i = 0; i < explosions.size(); i++) {
    Explosion e = explosions.get(i);
    e.display();
   
   if (e.size < 1) //destroy if animation ended
      explosions.remove(i); 
      
//      if(player != null && collide(e.x1,e.y1,e.x2,e.y2,player.x1,player.y1,player.x2,player.y2)) {
//        if(player.shieldTimer < 1) {
//          messages.add(new Message("terminated!",player.location.x,player.location.y,16,1));
//          lives--;
//          player = null;
//        }
    //}
  }
  
  for (int i = 0; i < spawners.size(); i++) {
    Spawner s = spawners.get(i);
    s.display();
    if(s.delay < 1) {
      robots.add(new EnemyRobot(s.x,s.y));
      spawners.remove(i); 
    }
  }
  
  for (int i = 0; i < messages.size(); i++) {
    Message m = messages.get(i);
    m.display();
    
    if(m.toDie < 1)
      messages.remove(i);
  }
  if(player != null) {
    player.display();
    player.update();
  }
  
  if(levelNumber > 0) {
    textSize(20);
    textAlign(LEFT);
    fill(255);
    text("score: " + score, 10, 20);
    text("lives: " + lives, 10, 50);
    textSize(16);
  fill(255);
  text("Wave " + levelNumber + ": " + level.name, 30, 690);
  }
  
  if(robots.size() < 1 && level.timePassed > 100) {
    
    textSize(28);
    textAlign(CENTER);
    fill(255);
    text("Level complete!", 640, 360);
    textSize(18);
    text("Warping to next level in " + finishDelay, 640, 420);
    
    spawners = new ArrayList<Spawner>();
    finishDelay--;
    if(finishDelay < 1) {
      levelNumber++;
      setup(); 
    }
  }
  
    if(player != null && mousePress && player.shootDelay < 1) {
      bullets.add(new Bullet(player.getLocation().x,player.getLocation().y,27));
      player.shootDelay = 10;
      shoot.play();
      shoot.rewind();    
    }
    
  if(player == null && levelNumber > 0 && lives > 0) {
    respawnDelay--;
    textAlign(CENTER);
    textSize(20);
    text("Respawning in " + respawnDelay,640,360);
    
    if(respawnDelay < 1) {
       player = new Player(640,360);
       revived.play();
       revived.rewind();
       respawnDelay = 100; 
    }
  }
  
  if(lives < 1) {
    fill(0);
    rectMode(CORNER);
    rect(0,0,width,height);
    fill(255);
    textAlign(CENTER);
    textSize(28);
    text("GAME OVER!", 640,360);
    textSize(20);
    text("Final score: " + score, 640,420);
  }
  
  if(paused) {
    fill(255);
    textAlign(CENTER);
    textSize(28);
    text("Paused", 640,360);
  }
}

// capture key press events
void keyPressed() {
  if (keyCode == 68) isRightPressed = true;
  if (keyCode == 65) isLeftPressed = true;
  if (keyCode == 87) isUpPressed = true;
  if (keyCode == 83) isDownPressed = true;
  if (keyCode == 32) isSpacePressed = true;
  if (keyCode == 81) {
    if(levelNumber > 0) {
      if(!paused) {
        noLoop(); 
        paused = true;
      }
      else {
        loop();
        paused = false; 
      }
    } 
  }
}

// capture key release events
void keyReleased() {
  if (keyCode == 68) isRightPressed = false;
  if (keyCode == 65) isLeftPressed = false;
  if (keyCode == 87) isUpPressed = false;
  if (keyCode == 83) isDownPressed = false;
  if (keyCode == 32) isSpacePressed = false;
}

void mousePressed() {
  mousePress = true;
}

void mouseReleased() {
  mousePress = false; 
}

//shamelessly stolen from processing.org
void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

boolean collide(float arg1_x1, float arg1_y1, float arg1_x2, float arg1_y2, float arg2_x1, float arg2_y1, float arg2_x2, float arg2_y2) {
  return arg1_x1 < arg2_x1 + (arg2_x2 - arg2_x1) &&
    arg1_x1 + (arg1_x2 - arg1_x1) > arg2_x1 &&
    arg1_y1 < arg2_y1 + (arg2_y2 - arg2_y1) &&
    arg1_y1 + (arg1_y2 - arg1_y1) > arg2_y1;
}
