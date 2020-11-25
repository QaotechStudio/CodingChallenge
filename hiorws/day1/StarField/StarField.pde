
Star[] stars = new Star[500];

float speed;

void setup() {
  size(900, 900);
  
  for (int i=0; i<stars.length; i++) {
    stars[i] = new Star();
  }
}

void draw() {
  background(0);
  speed = map(mouseX, 0, width, 0, 50);
  
  pushMatrix();
  translate(width/2, height/2);
  for (int i=0; i<stars.length; i++) {
    stars[i].update();
    stars[i].display();
  }
  
  popMatrix();
}
