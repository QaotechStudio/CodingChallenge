class Drop {
  PVector location;
  float ySpeed;
  float size;
  float rotate;
  float rotateSpeed;
  Drop() {
    _init();
  }

  void _init() {
    location = new PVector(random(width), random(-200, -100), random(0, 20));
    ySpeed = map(location.z, 0, 20, 1, 2);
    size = map(location.z, 0, 20, 10, 20);
    rotate = 0;
    rotateSpeed = random(0.005, 0.1);
  }

  void update() {

    // speed
    location.y += ySpeed;

    // gravity
    float gravity = map(location.z, 0, 20, 0, 0.2);
    ySpeed += gravity;

    // rotation
    rotate += rotateSpeed;

    // check boundries
    if (location.y > height) {
      _init();
    }
  }

  void display() {
    colorMode(HSB, 360, 100, 100);

    int deltaTime = int(millis() / 1000) % 6; 

    // hue
    float h = map(deltaTime, 0, 6, 0, 360);
    stroke(h, 100, 100);

    // saturation
    //float s = map(deltaTime, 0, 6, 0, 100);
    //stroke(120, 100, s);

    noFill();

    float thick = map(location.z, 0, 20, 1, 3);
    strokeWeight(thick);

    pushMatrix();
    translate(location.x, location.y, location.z);

    rotateX(rotate);
    rotateY(rotate);
    rotateZ(rotate);

    box(thick * 10);
    popMatrix();
  }
}
