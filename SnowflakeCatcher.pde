//line 40 -- need to set constraints

PImage snowflake1;
PImage snowflake2;
PImage snowflake3;
PImage snowflake4;
PImage snowflake5;
PImage snowflake6;
PImage snowflake7;
PImage snowflake8;
Snowflake[] snowflakes;
Snowflake bob = new Snowflake();
int rectW = 50;
float rectH = 60;
float snowflakesKilled = 0;
boolean showBucket = false;
void setup() {
  size(800, 600);
  snowflake1 = loadImage("1.png");
  snowflake2 = loadImage("2.png");
  snowflake3 = loadImage("3.png");
  snowflake4 = loadImage("4.png");
  snowflake5 = loadImage("1rotated.png");
  snowflake6 = loadImage("2rotated.png");
  snowflake7 = loadImage("3rotated.png");
  snowflake8 = loadImage("4rotated.png");
  
  snowflakes = new Snowflake[(width+height)/10];
  for (int i = 0; i < snowflakes.length; i ++) {
    snowflakes[i] = new Snowflake();
  }
  background(255);
  //noStroke();
  noCursor();
  imageMode(CENTER);
}

void draw() {
  background(255);
  rect(0,width,0,height);
  for (int i = 0; i < snowflakes.length; i ++) {
    snowflakes[i].run();
  }
  
  //bob.run();
  
  if (showBucket) {
    stroke(190);
    fill(0,164,230);
    rect(constrain(mouseX-rectW/2,0,width-rectW-1),height-rectH-1,rectW,rectH);
    noStroke();
    fill(255);
    rect(constrain(mouseX-rectW/2+1,1,width-rectW),height-rectH,rectW-1,constrain(rectH-1-snowflakesKilled,0,height-1));
    //rect(constrain(mouseX-rectW/2+1,1,width-rectW),height-rectH,rectW-1,rectH-1-snowflakesKilled);
  }
}

void mousePressed() {
  if (showBucket && mouseButton == LEFT) {
    showBucket = false;
    snowflakesKilled = 0;
  } else {
    showBucket = true;
  }
}

class Snowflake {
  float x, y, speed;
  int type;
  boolean dead = false;

  Snowflake() {
    x = (int)(Math.random()*width+1);
    y = (int)(Math.random()*height+1);
    speed = (float)(Math.random()*0.6)+0.3;
    type = (int)(Math.random()*8)+1;
  }

  void show() {
    if (!dead) {
      if (type == 1) {
        image(snowflake1, x, y);
      } else if (type == 2) {
        image(snowflake2, x, y);
      } else if (type == 3) {
        image(snowflake3, x, y);
      } else if (type == 4) {
        image(snowflake4, x, y);
      } else if (type == 5) {
        image(snowflake5, x, y);
      } else if (type == 6) {
        image(snowflake6, x, y);
      } else if (type == 7) {
        image(snowflake7, x, y);
      } else if (type == 8) {
        image(snowflake8, x, y);
      }
    }
  }

  void move() {
    y += speed;
    if (y > height+10) {
      y = -20;
      speed = (float)(Math.random()*0.6)+0.3;
      dead = false;
    }
  }

  void die() {
    if (showBucket&&x > mouseX-rectW/2 && x < mouseX+rectW/2 && 
        y > height-rectH && y < height-rectH+1) {
      dead = true;
      // println(frameCount);
      snowflakesKilled += 0.5;
    }
  }

  void run() {
    show();
    move();
    die();
  }
}
