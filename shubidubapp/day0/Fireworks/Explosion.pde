class Explosion {
    PVector eColor;
    PVector location;
    
    float size;
    float speed;
    float duration;
    int counter = 0;
    int start_time;
    
    int scatter;
    int isDead = 0;
  
    Explosion(PVector pLocation, float z){
      eColor = new PVector(int(random(0, 255)),int(random(0, 255)),int(random(0, 255)));
      location = pLocation;
      size = z * 7;
      speed = random(0.02, 0.04);
      duration = int(random(1, 5))* 1000;
      scatter = int(random(10, 30));
      start_time = millis();
    }
    
    void display(){
      float passedTime = millis() - start_time;
      if(passedTime < duration){
        for (int i=0; i < scatter; i++){
          pushMatrix();
          translate(location.x,location.y);
          rotate(PI*2 / scatter * i);
          ellipseMode(CENTER);
          colorMode(RGB);
          fill(eColor.x, eColor.y, eColor.z);
          ellipse(speed*passedTime,speed*passedTime,size,size);
          popMatrix();
        }
      } else {
        isDead = 1;
      }
    }
}
