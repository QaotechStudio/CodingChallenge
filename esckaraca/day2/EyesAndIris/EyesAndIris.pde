PVector irisLoc = new PVector(150, 0);
PVector velocity = new PVector(0, 0);
float topspeed = 20;

void setup() {
  size(900, 900);
  smooth();
  noFill();
  stroke(0);
}
void draw() {
  background(240);
  pushMatrix();
  translate(width/2, height/2);
  rotate(0.05 * frameCount);
  drawEyes();
  irisMove();
  popMatrix();
}

void drawEyes() {
  for (float i = width * 1.2; i < width * 3; i += width/5) {
    float irisSize = i/5;
    if (frameCount % 120  < 40 ) {
      strokeWeight(20);
      ellipse(0, 0, i, i/2);
      ellipse(irisLoc.x, irisLoc.y, irisSize, irisSize);
    } else if (frameCount % 120 >= 40 && frameCount % 120 < 80) {
      strokeWeight(20);
      ellipse(0, 0, i * 2, i/2);
      ellipse(0, 0, i / 2, i * 2);
      ellipse(0, 0, irisSize, irisSize);
    } else {
      strokeWeight(20);
      ellipse(0, 0, i, i/2);
      strokeWeight(10);
      ellipse(-irisLoc.x, irisLoc.y, irisSize, irisSize);
      ellipse(irisLoc.x, irisLoc.y, irisSize, irisSize);
    }
  }
}
void irisMove() {
  PVector newLoc = new PVector(0, 0);
  PVector acceleration = PVector.sub(newLoc, irisLoc);
  acceleration.setMag(0.2);
  velocity.add(acceleration);
  velocity.limit(topspeed);
  irisLoc.add(velocity);
}
