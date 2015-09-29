//line 40 -- need to set constraints

PImage snowflake1;
PImage snowflake2;
PImage snowflake3;
PImage snowflake4;
Snowflake[] snowflakes;
Snowflake bob = new Snowflake();
int rectW = 50;
int rectH = 60;
int snowflakesKilled = 0;
void setup() {
  size(800, 600);
  snowflake1 = loadImage("1.png");
  snowflake2 = loadImage("2.png");
  snowflake3 = loadImage("3.png");
  snowflake4 = loadImage("4.png");
  
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
  for (int i = 0; i < snowflakes.length; i ++) {
    snowflakes[i].run();
  }
  
  //bob.run();
  
  stroke(255,0,0);
  fill(255);
  rect(constrain(mouseX-rectW/2,0,width-rectW-1),height-rectH-1,rectW,rectH);
  noStroke();
  fill(0);
  rect(constrain(mouseX-rectW/2+1,0,width-rectW-1),height-rectH,rectW-1,constrain(rectH-1-snowflakesKilled,height-rectH,height+rectH-1));
  
}


class Snowflake {
  float x, y, speed;
  int type;
  boolean dead = false;

  Snowflake() {
    x = (int)(Math.random()*width+1);
    y = (int)(Math.random()*height+1);
    speed = (float)(Math.random()*0.6)+0.3;
    type = (int)(Math.random()*4)+1;
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
      }
    }
  }

  void move() {
    y += speed;
    if (y > height+10) {
      y = -20;
      speed = (float)(Math.random()*0.6)+0.3;
    }
  }

  void die() {
    if (x > mouseX-rectW/2 && x < mouseX+rectW/2 && 
        y > height-rectH+10 && y < width-rectH) {
      dead = true;
      // println(frameCount);
      snowflakesKilled++;
    }
  }

  void run() {
    show();
    move();
    die();
  }
}
