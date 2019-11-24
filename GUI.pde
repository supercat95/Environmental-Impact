import peasy.*;

PeasyCam camera;

Slider[] sliders = new Slider[6];
float xIncrement = 0;
float yIncrement;

String[] labels = {"Meat Consumption", "Dairy Consumption", "Disposables Use", "Zero Waste Use", "Recycling and Upcycling", "Proper Recycling"};

PShape planetSphere;
PImage planetTexture;

float yRotation = 1.0;
float zRotation = 23;
float radius;

float score;

ArrayList<Shape> shapes;
PShape cowShape;
PShape treeShape;
PShape turtleShape;
PShape[] shapeOptions = {cowShape, treeShape, turtleShape};
int numberOfShapes;

PImage cowTexture;
PImage NULL;
PImage turtleTexture;
PImage[] textureOptions = {cowTexture, NULL, turtleTexture};

int index;

void setup() {
  //fullScreen(P3D);
  size(640, 400, P3D);
  //size(1280,800,P3D);
  
  initializePeasyCam();
  
  radius = height/2;
  
  initializeOverloadedSliders();
  initializePlanet();
  initializeObjectsAndImages();
  initializeShapes();
}

void draw() {
  background(#060115); // dark blue/purple
  rotatePlanetAndShapes();
  camera.beginHUD();
    drawSliders();
    drawLabels();
    drawSliderPieces();
    
    resetCameraButton();
    resetSlidersButton();
    
    pushMatrix();
    //fill(255,255,255);
    //translate(0,height-40,0);
    //rect(0,0, 40,40);
    //fill(0,0,0);
    //textSize(15);
    //text(pmouseX, 15, 10);
    //text(pmouseY, 15, 30);
    popMatrix();
  camera.endHUD();
  
  checkIfScoreHasChanged();
  peasyCamOrNot();
  println(returnScore(), howManyShapesNeeded(), shapes.size());
}

// ==================================================
void initializePeasyCam() {
  camera = new PeasyCam(this, 0, 0, 0, (height/2.0) / tan(PI*60.0 / 360.0));
  camera.setYawRotationMode();
  camera.setMinimumDistance(250);
  camera.setMaximumDistance(450);
}

void initializeOverloadedSliders() { 
  for (int i = 0; i < sliders.length; i++) {
    xIncrement = width/12 + xIncrement;
    sliders[i] = new Slider(xIncrement);
    xIncrement = width/20 + xIncrement;
  }
}

void initializePlanet() {
  noStroke();
  planetSphere = createShape(SPHERE, radius);
  planetTexture = loadImage("planetTexture.png");
  planetSphere.setTexture(planetTexture);
}

void initializeObjectsAndImages() {
  cowShape = loadShape("cowShape.obj");  // file from https://free3d.com/3d-model/cow-v4--997323.html
  treeShape = loadShape("treeShape.obj"); // file from https://free3d.com/3d-model/low-poly-tree-73217.html
  turtleShape = loadShape("turtleShape.obj"); // file from https://free3d.com/3d-model/-sea-turtle-v1--427786.html
  
  cowTexture = loadImage("cowFur.jpg"); // image from https://milkgenomics.org/wp-content/uploads/2013/08/bigstock-dairy-cow-fur-skin-backgroun-40931641.jpg
  NULL = loadImage("NULL.jpg"); // image is an unused placeholder to allow for setFill()
  turtleTexture = loadImage("turtleTexture.jpg"); // image from https://s-media-cache-ak0.pinimg.com/736x/77/23/86/772386b662e4ca88794dbb9463c57ea9.jpg 
}

void initializeShapes() {
  shapes = new ArrayList<Shape>();
  for (int i = 0; i < sliders[0].totalScore * 60; i++) {
    shapes.add(new Shape(radius));
  }
}

// ---------------------------------------------------
void rotatePlanetAndShapes() {
  pushMatrix();
    translate(0, height/2, 0);
    //rotateZ(zRotation);  
    //rotateY(yRotation);
        planetSphere.scale(1);
          shape(planetSphere);
          drawShapes();
  popMatrix();
  
  if (mousePressed == false || mousePressed && pmouseY < height/3) { yRotation -= 0.01; }
}

// ---------------------------------------------------
void peasyCamOrNot() {
  if (pmouseY < sliders[0].yPosition + sliders[0].sliderHeight) {
    camera.setActive(false);
  }
  else {
    camera.setActive(true);
  }
}

// ---------------------------------------------------
void drawSliders() {
  pushMatrix();
    translate(width/12,0,0);
  for (int i = 0; i < sliders.length; i++) {
    sliders[i].createSlider();
  }
  popMatrix();
}

void drawSliderPieces() {
  for (int i = 0; i < sliders.length; i++) {
    sliders[i].checkForSliding();
  }
}

void drawLabels() {
  for (int i = 0; i < sliders.length; i++) {
      fill(255,255,255);
      textSize(width/80);
      textAlign(CENTER);
      text(labels[i], sliders[i].xPosition + width/12, sliders[i].sliderHeight + sliders[i].yPosition);
  }
}

void drawShapes() {
  for (int i = 0; i < shapes.size(); i ++) {
      pushMatrix();
        Shape s = shapes.get(i);
        s.drawShape();
      popMatrix();
    }
}
  
// ---------------------------------------------------
float returnScore() {
  if (sliders[0].checkIfHovering() && mousePressed) {
    sliders[0].meatScore = map(pmouseY, sliders[0].yPosition/2, sliders[0].yPosition/2 + sliders[0].sliderHeight, 0.0, 1.0);
  }
  if (sliders[1].checkIfHovering() && mousePressed) {
    sliders[0].dairyScore = map(pmouseY, sliders[0].yPosition/2, sliders[0].yPosition/2 + sliders[0].sliderHeight, 0.0, 1.0);
  }
  if (sliders[2].checkIfHovering() && mousePressed) {
    sliders[0].disposablesScore = map(pmouseY, sliders[0].yPosition/2, sliders[0].yPosition/2 + sliders[0].sliderHeight, 0.0, 1.0);
  }
  if (sliders[3].checkIfHovering() && mousePressed) {
    sliders[0].zerowasteScore = map(pmouseY, sliders[0].yPosition/2, sliders[0].yPosition/2 + sliders[0].sliderHeight, 0.0, 1.0);
  }
  if (sliders[4].checkIfHovering() && mousePressed) {
    sliders[0].upcyclingScore = map(pmouseY, sliders[0].yPosition/2, sliders[0].yPosition/2 + sliders[0].sliderHeight, 0.0, 1.0);
  }
  if (sliders[5].checkIfHovering() && mousePressed) {
    sliders[0].recyclingScore = map(pmouseY, sliders[0].yPosition/2, sliders[0].yPosition/2 + sliders[0].sliderHeight, 0.0, 1.0);
  }

  return score = map((sliders[0].recyclingScore + sliders[0].upcyclingScore + sliders[0].zerowasteScore - sliders[0].disposablesScore - sliders[0].dairyScore - sliders[0].meatScore) / 6, -0.5, 0.5, 0.0, 1.0);
}

// ---------------------------------------------------
void checkIfScoreHasChanged() {
  for (int i = 0; i < sliders.length; i++) {
    if (sliders[i].checkIfHovering() && mousePressed) {
      addOrRemoveShapes();
    }
  }
}

int howManyShapesNeeded() {
  if (shapes.size() ==  0 && returnScore() == 0.499999994) { return numberOfShapes = 30; }
  if (returnScore() == 0) { return numberOfShapes = 60; }
  if (returnScore() == 1) { return numberOfShapes = 0; }
  
  return numberOfShapes = int(map(returnScore(), 0, 1, 60, 0));
}

void addOrRemoveShapes() {
  for (index = shapes.size(); index < howManyShapesNeeded(); index++) {
    shapes.add(new Shape(radius)); 
    drawShapes();
   }

  for (index = shapes.size()-1; index > howManyShapesNeeded(); index--) {
    shapes.remove(index);
    drawShapes();
  }
}

// ---------------------------------------------------
void resetCameraButton() {
  pushMatrix();
    translate(width*.92, height - (width*.08));
      fill(#FFE600);
      rect(0, 0, width*.08, width*.08, 7);
      
      fill(0);
      textAlign(CENTER,CENTER);
      textSize(width/60);
      text("RESET CAMERA", 0, 0, width*.08, width*.08);
  popMatrix();
}

void resetSlidersButton() {
  pushMatrix();
    translate(0, height - (width*.08));
      fill(#FFE600);
      rect(0, 0, width*.08, width*.08, 7);
      
      fill(0);
      textAlign(CENTER,CENTER);
      textSize(width/60);
      text("RESET SLIDERS", 0, 0, width*.08, width*.08);
  popMatrix();
}

void mousePressed() {
  if (pmouseX > width*.92 && pmouseY > height-(width*.08)) {
    camera.reset();
  }
  
  if (pmouseX < width*.08 && pmouseY > height-(width*.08)) {
    for (int i = 0; i < sliders.length; i++) {
      sliders[i].sliderPiece(sliders[0].yPosition);
      sliders[0].defaultScores();
    }
  }
}
