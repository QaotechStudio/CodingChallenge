float rectposX;
float rectposY;
int degree = 0;
int alphaValue = 50;
int i = 10;

void setup() {
  size(900, 900);
  rectMode(CENTER);
  textAlign(CENTER);
  smooth(2);
  rectposX = width/2;
  rectposY = height/2;
}


void draw() {
  background(0);

  noStroke();
  fill(color(#968c83));
  rect(rectposX, rectposY, width - 20, height - 20, 5);
  if (frameCount % 10 == 0) {
    rectposY += 20;
  } else {
    rectposY = height/2;
  }

  stroke(0);
  strokeWeight(5);
  line(0, height/2, width, height/2);
  strokeWeight(10);
  line(width/2, 0, width/2, height);

  fill(0, 0, 0, alphaValue);
  noStroke();
  arc(width/2, height/2, width * 1.5, height * 1.5, 0, radians(degree), PIE);
  degree += 5;
  degree %= 360;

  noFill();
  stroke(color(#fbf7f0));
  ellipse(width/2, height/2, width - 150, height - 100);

  fill(color(#fbf7f0));
  textSize(500);
  text(i, width/2, height/2 + 180);
  if (degree == 0) {
    i -= 1;
  }

  if (i < 0) {
    exit();
  }
}
