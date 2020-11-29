class Agent {
  PVector location;
  PVector speed;
  float size;
  float range = 250;
  float speedMax = 2.5;
  
  Agent() {
    location = new PVector(0, 0, 0);
    speed = new PVector(random(-speedMax, speedMax), random(-speedMax, speedMax), random(-speedMax, speedMax));
    size = 20;
  }

  void update() {
    location.add(speed);
    if (location.x > range || location.x < -range ) {
      speed.x *= -1;
    }
    if (location.y > range || location.y < -range ) {
      speed.y *= -1;
    }
    if (location.z > range || location.z < -range ) {
      speed.z *= -1;
    }
  }

  int getCollision() {
    int side = 0;

    if (location.x > range) {
      side = 1;
    } else if (location.x < -range) {
      side = 2;
    } else if (location.y > range) {
      side = 3;
    } else if (location.y < -range) {
      side = 4;
    } else if (location.z > range) {
      side = 5;
    } else if (location.z < -range) {
      side = 6;
    }
    return side;
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y, location.z);
    noFill();
    stroke(127);
    sphere(size);
    popMatrix();
  }
}
