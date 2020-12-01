String IMAGE_PATH="dvd_logo.png";
Logo logo;
int counter = 0;

void setup() {
  size(1400, 900);
  logo = new Logo();
  frameRate(30);
}

void draw() {
  background(0);
  logo.update();
  logo.display();
}

class Logo {
  float SIZE_RATIO;
  PVector location;
  PVector speed;
  PImage img;
  int counter;
  
  Logo(){
   img = loadImage(IMAGE_PATH);
   speed = new PVector(width/200, height/200);
   location = new PVector(random(0, width), random(0, height));
  }
 
 void update(){
   if (width < location.x + speed.x + img.width || location.x + speed.x < 0 ){
     speed.set(speed.x * -1, speed.y);
   }
   if (height < location.y + speed.y + img.height || location.y + speed.y < 0){
     speed.set(speed.x, speed.y * -1);
   }
   location.set(location.x + speed.x, location.y + speed.y);
 }
  
 void display(){
   image(img, location.x, location.y);
 }
  
}
