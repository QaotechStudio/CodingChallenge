Drop[] drops = new Drop[100];

void setup () {
  size(900, 900, P3D);

  for (int i=0; i<drops.length; i++) {
    Drop newDrop = new Drop();
    drops[i] = newDrop;
  }
}

void draw() {
  background(0);

  for (int i=0; i<drops.length; i++) {
    drops[i].update();
    drops[i].display();
  }
}
