// Sound pack from: https://freesound.org/people/TEDAgame/packs/25405/
// public domain

import ddf.minim.*;

Minim minim;
AudioPlayer[] playlist;
AudioInput input;

Agent[] agents = new Agent[3];

float boxSize = 500;
float r = 0;

void setup() {
  size(900, 900, P3D);

  sphereDetail(5);

  minim = new Minim(this);
  input = minim.getLineIn();

  playlist = new AudioPlayer[6];
  playlist[0] = minim.loadFile("d3.wav");
  playlist[1] = minim.loadFile("f3.wav");
  playlist[2] = minim.loadFile("a3.wav");
  playlist[3] = minim.loadFile("g3.wav");
  playlist[4] = minim.loadFile("b3.wav");
  playlist[5] = minim.loadFile("e3.wav");

  for (int i=0; i<agents.length; i++) {
    agents[i] = new Agent();
  }
}

void draw() {
  background(0);

  pushMatrix();
  translate(width/2, height/2);
  rotateY(r);

  // box
  drawBox();

  // agents
  for (int i=0; i<agents.length; i++) {
    agents[i].update();
    agents[i].display();
    int collision = agents[i].getCollision();
    if (collision != 0) {
      collisionAction(collision);
    }
  }

  popMatrix();

  r += 0.005;
}

void drawBox() {
  noFill();
  strokeWeight(3);
  stroke(0, 255, 0);
  box(boxSize);
}

void collisionAction(int col) {
  col = col - 1;
  playlist[col].rewind();
  playlist[col].play();
}
