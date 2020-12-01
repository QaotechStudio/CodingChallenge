class Firework {
  float DEFAULT_FIREWORK_W = 10;
  float DEFAULT_FIREWORK_H = 20;
  float DEFAULT_FIREWORK_SPEED = -2;

  PVector location; // Bottom left corner
  float flightHeight; // Firework will explode when it reaches this height-y-
  float z; // Just the distance from screen 0 is farthest -invisible- 1 is closest
  float speed;
  
  
  int isDead = 0;
  Explosion explosion;

  Firework() {
    location = new PVector(random(0, width), 900 + random(1, 100));
    flightHeight = height * random(0.05, 0.4);
    z = random(0.3, 1);
  }

  void update(){
    if(explosion == null){
      if (flightHeight >= location.y){
        if (explosion == null){
          explosion = new Explosion(location, z);
        }
      } else {
        location.add(0,DEFAULT_FIREWORK_SPEED);
      }
    } else {
      isDead = explosion.isDead;
    }
  }
    
  void display(){
    fill(255);
    if(explosion == null){
      rect(location.x, location.y, DEFAULT_FIREWORK_W * z, DEFAULT_FIREWORK_H * z);
    } else {
      explosion.display(); 
    }
  }
}
