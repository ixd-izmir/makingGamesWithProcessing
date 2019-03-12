/*
 Name: Game Background on Any Display
 Desc: resizing background image to display on any screen resolution in fullscreen mode
 Author: Ceren Kayalar for xLab
 Date: 12march2019
*/

PImage backgroundImg;
float screenAspectRatio;
float backgroundAspectRatio;
float widthRatio, heightRatio;

void setup() {
  fullScreen();
  backgroundImg = loadImage("case2.png");
  backgroundAspectRatio = backgroundImg.width / backgroundImg.height;
}

void draw() {
  background(0);
  screenAspectRatio = (float) width / height;
  widthRatio = (float) width / backgroundImg.width;
  heightRatio = (float) height / backgroundImg.height;

  println(screenAspectRatio, " ", widthRatio, " ", heightRatio);
  if (screenAspectRatio > backgroundAspectRatio) 
    image(backgroundImg, 0, height/2-backgroundImg.height/2, heightRatio*backgroundImg.width, height);

  if (screenAspectRatio < backgroundAspectRatio)
    image(backgroundImg, 0, height/2-(widthRatio*backgroundImg.height)/2, width, widthRatio*backgroundImg.height);


  println("Current Display: (", width, "x", height, ") Background: ( " + backgroundImg.width, "x", backgroundImg.height, ")");
}
