/* 
  ixd3101f18 - characterStatusInTime
  update and display a parameter that effects one game character 
  mar12Tue
  @Ceren Kayalar 
*/


int johnDoeFoodRepo;
int foodRepoSize;
int foodRepoPosX, foodRepoPosY, foodRepoUnitWidth;
color foodRepoFillColor, foodRepoStrokeColor;
int currentGameTimeInSecs;
PFont repoFont;

void setup() {

  size(600, 400);
  johnDoeFoodRepo = 7;
  foodRepoSize = 7;
  foodRepoPosX = 50;
  foodRepoPosY = 50;
  foodRepoUnitWidth = 20;
  foodRepoFillColor = color(#FFCC00);  
  foodRepoStrokeColor = color(204, 153, 0);
  currentGameTimeInSecs = millis() / 1000;
  repoFont = loadFont("AndaleMono-48.vlw");
  
}

void update() {

  
  println(currentGameTimeInSecs);
  // game loop updates itself 60fps, we need to detect the change
  // in game time in order to reduce the values only once per second
  if (currentGameTimeInSecs != (int)millis()/1000) {
    currentGameTimeInSecs = (int)millis()/1000;
    if (currentGameTimeInSecs % 5 == 0)
      johnDoeFoodRepo--;
  }
  
}

void displayGameUI() {

  // display John Doe's Food Repo
  int x = foodRepoPosX;
  int y = foodRepoPosY;

  textFont(repoFont);
  textAlign(CENTER, TOP);
  text("F", x, y);
  x += 20;
  stroke(foodRepoStrokeColor);
  for (int i = 0; i < foodRepoSize; i++) {
    if (i < johnDoeFoodRepo) {
      fill(foodRepoFillColor);
    } else
      noFill();
    rect(x, y, foodRepoUnitWidth, foodRepoUnitWidth*2);
    x += foodRepoUnitWidth;
  }
  
  if (johnDoeFoodRepo == 0) {
    text("JOHN DOE STARVED!", width/2, height/2);
  }
  
}

void draw() {

  background(100);
  update();
  displayGameUI();
}
