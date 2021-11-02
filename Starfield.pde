class Cloud {
  int myX, myY, myHeight, myWidth, mySpeed, myColour, myOpacity;
  Cloud() {
    myX = (int)(Math.random()*150-150);
    myY = (int)(Math.random()*350);
    myHeight = (int)(Math.random()*50)+10;
    myWidth = (int)(Math.random()*150)+30;
    mySpeed = (int)(Math.random()*5)+1;
    myColour = 255;
    myOpacity = (int)(Math.random()*100);
  }
  void move() {
    myX+=mySpeed;
    if (myX >= 1150) {
      myX = -150;
    }
  }
  void show() {
    noStroke();
    fill(myColour, myOpacity);
    ellipse(myX, myY, myWidth, myHeight);
  }
}

class Cactus {
  int myX, myY, myHeight;
  Cactus() {
    myX = (int)(Math.random()*1000)+1;
    myY = (int)(Math.random()*250)+750;
    myHeight = (int)(Math.random()*15)+25;
  }
  void show() {
    fill(92, 117, 94);
    ellipse(myX, myY-25, 15, myHeight+25);
    ellipse(myX, myY-25, 30, myHeight-15);
    ellipse(myX-15, myY-35, 10, myHeight-5);
    ellipse(myX+15, myY-35, 10, myHeight);
  }
}

Cloud [] hoard = new Cloud [(int)(Math.random()*30)+20]; //clouds
Cactus [] cacti = new Cactus [(int)(Math.random()*10)+1]; //Cacti
void setup() {
  size(1000, 1000);
  background(112, 128, 144); //sky
  fill(205, 170, 109); //desert
  rect(0, 750, 1000, 250); //desert
  for (int i = 0; i < hoard.length; i++) {
    hoard[i] = new StormCloud();
  }
  for (int i = 20; i < hoard.length; i++) {
    hoard[i] = new Cloud();
  }
  if (Math.random() < 0.7) {
    for (int i = 0; i < 1; i++) {
      cacti[i] = new flowerCactus();
    }
  } else {
    for (int i = 0; i < 1; i++) {
      cacti[i] = new hatCactus();
    }
  }
  for (int i = 1; i < cacti.length; i++) {
    cacti[i] = new Cactus();
  }
}

void draw() {
  noStroke();
  background(112, 128, 144, 75); //sky
  fill(205, 170, 109); //desert
  rect(0, 750, 1000, 250); //desert
  for (int i = 0; i < hoard.length; i++) {
    hoard[i].move();
    hoard[i].show();
    //((StormCloud)hoard[0]).Lightning();
  }
  for (int i = 0; i < cacti.length; i++) {
    cacti[i].show();
  }
}

void mousePressed()
 {
   ((StormCloud)hoard[0]).Lightning();
   ((StormCloud)hoard[0]).sX = ((StormCloud)hoard[0]).myX;
   ((StormCloud)hoard[0]).sY = 100;
   ((StormCloud)hoard[0]).eX = ((StormCloud)hoard[0]).myX;
   ((StormCloud)hoard[0]).eY = 100;
 }

class StormCloud extends Cloud {
  //lightning
  int sX;
  int sY;
  int eX;
  int eY;
  StormCloud() {
    myX = (int)(Math.random()*100)+300;
    myY = (int)(Math.random()*30)+50;
    myHeight = (int)(Math.random()*40)+40;
    myWidth = (int)(Math.random()*60)+160;
    mySpeed = 1;
    myOpacity = (int)(Math.random()*60)+100;
    myColour = (int)(Math.random()*20)+80;
    sX = myX;
    sY = 100;
    eX = myX;
    eY = 100;
  }
  void Lightning() {
    strokeWeight(5);
    stroke(125, 249, 255);
    while (eY<=800)
    {
      eX = sX;
      eY = sY;
      sX += (int)(Math.random()*18-9);
      sY += (int)(Math.random()*9);
      line(sX, sY, eX, eY);
    }
  }
}

class flowerCactus extends Cactus {
  void show() {
    super.show();
    fill(255, 209, 220);
    ellipse(myX+3, myY-30, 5, 5);
    fill(189, 183, 107);
    ellipse(myX+3, myY-30, 2, 2);
  }
}

class hatCactus extends Cactus {
  void show() {
    super.show();
    fill(164, 116, 73);
    ellipse(myX, myY-50, 30, 5);
    ellipse(myX, myY-55, 10, 15);
  }
}
