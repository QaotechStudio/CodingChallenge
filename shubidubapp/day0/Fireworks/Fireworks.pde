int fireworkAmount = 20;

Firework[] fireworks = new Firework[fireworkAmount];


void setup() {
  size(900,900);
  for (int i = 0; i < fireworkAmount; ++i) {
      fireworks[i] = new Firework();
  }
  noStroke();
}

void draw(){
    background(0);
    for (int i=0; i < fireworkAmount; i++){
        fireworks[i].update();
        fireworks[i].display();
        if(fireworks[i].isDead == 1) {
          fireworks[i] = new Firework();
        }
    }
}
