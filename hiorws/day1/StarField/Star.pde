class Star {
  PVector location;
  float z;
  float pz;

  float size = 25;

  Star() {
    location = new PVector(random(-width/2, width/2), random(-height/2, height/2));
    z = random(width/2);
    pz = z;
  }

  void update() {
    z = z - speed;
    if (z < 1) {
      z = width/2;
      location.x = random(-width/2, width/2);
      location.y = random(-height/2, height/2);
      pz = z;
    }
  }

  void display() {
    noStroke();
    fill(255);

    float sx = map(location.x / z, 0, 1, 0, width/2);
    float sy = map(location.y / z, 0, 1, 0, height/2);

    float r = map(z, 0, width/2, 10, 0);

    ellipse(sx, sy, r, r);

    float px = map(location.x / pz, 0, 1, 0, width/2);
    float py = map(location.y / pz, 0, 1, 0, height/2);

    pz = z;

    stroke(255);
    line(px, py, sx, sy);
  }
}
