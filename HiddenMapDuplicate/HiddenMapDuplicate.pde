/*

Name: Hidden Map Duplicate

Desc: "Hidden Map Duplicate" is a straightforward approach to develop a point and click mechanics in Processing. This approach consists in duplicating each scene in two images: the first visible to the player retains its visual characteristics, the second one works as a kind of mask in which everything but the interactive elements is removed and each interactive area is defined with a different colour. It is good practice to use PNG format to keep the colours exact instead of a JPEG which due to compression might add colour noise.

In Processing the two images are loaded and only the first visual is shown to the player. The second is analysed by using the GET function to pick a pixel from it corresponding to the mouse position. The colour extracted from the image is than compared to a map and the consequent action is applied using for example a switch-case.

Author: Daniele Savasta for xLab

*/
PImage scene;                   // scene contain the image visible to the player
PImage hotspots;                // hotspots contain an image with the interactive hotspots colored with a flat tone lke a mask 

int stage=0;                    // this variable store the index of the stage in which the game is

color red=color(255,0,0);       // red color defined for easy reference
int blue=-16776961;             // (0,0,255) blue color defined as absolute number not interpreted by the color function
color green=color(0,255,0);     // green color defined for easy reference

int colorValue;                 // this variable store

void setup() {
  size(960, 540);
  scene=loadImage("scene_0.png");       // loading the scene (what the player will see)
  hotspots=loadImage("scene_0_hotspots.png"); // loading the hotspots image (this will be checked for interactive areas but will not be visible)
}

void draw() {
  background(0);                      // background
  image(scene, 0, 0);                 // displaying the image
  colorValue=hotspots.get(mouseX, mouseY);  // saving the color corresponding to the mouse position
  println(int(red(colorValue)),int(green(colorValue)),int(blue(colorValue))); // printing on console the found values in r g b
}

// load the correct stage/scene/hotspot according to the found color 
void mouseReleased() {
  switch(stage) {  
  case 0: 
    if (colorValue==red) { stage=1; scene=loadImage("scene_1.png"); hotspots=loadImage("scene_1_hotspots.png"); }
    if (colorValue==blue){ stage=2; scene=loadImage("scene_2.png"); hotspots=loadImage("scene_2_hotspots.png"); };
    break; 
  case 1:  if (colorValue==green) { stage=0; scene=loadImage("scene_0.png"); hotspots=loadImage("scene_0_hotspots.png"); }
    break;
  case 2: if (colorValue==green) { stage=0; scene=loadImage("scene_0.png"); hotspots=loadImage("scene_0_hotspots.png"); }
    break;
  }
}
