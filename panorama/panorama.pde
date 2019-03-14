PImage panorama;
int x=0;

void setup(){
  size(500,667);
  panorama = loadImage("download.jpg");
}

void draw(){
  backgroundMovement();
}

void backgroundMovement(){
    image(panorama,x,0);
  if(mouseX>400) {
    if(x>-499) x-=5;
  }
  
  if(mouseX<100) {
    if(x<0) x+=5;
  }
}
