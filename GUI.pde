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
PShape[] shapeOptions = {cowShape, treeShape};
int numberOfShapes;

PImage cowTexture;
PImage NULL;
PImage[] textureOptions = {cowTexture};

void setup() {
  //fullScreen(P3D);
  size(640, 400, P3D);
  //frameRate(200);
  
  initializePeasyCam();
  camera.setYawRotationMode();
  
  radius = height/2;
  
  initializeOverloadedSliders();
  initializePlanet();
  initializeObjectsAndImages();
  initializeShapes();
  
  drawShapes();
}

void draw() {
  //background(#060115); // dark blue/purple
  //rotatePlanet();
  camera.beginHUD();
    drawSliders();
    drawLabels();
    drawSliderPieces();
    
    resetButton();
  camera.endHUD();
  
  peasyCamOrNot();
  checkIfScoreHasChanged();
  drawShapes();
  println(sliders[0].calculateImpactScore(), howManyShapesNeeded(), shapes.size());
  
  fill(255,255,255);
  translate(0,height-40,0);
  rect(0,0, 40,40);
  fill(0,0,0);
  textSize(15);
  text(pmouseX, 15, 10);
  text(pmouseY, 15, 30);
  
}

// ==================================================
void initializePeasyCam() {
  camera = new PeasyCam(this, width/2, height/2, 0, (height/2.0) / tan(PI*60.0 / 360.0)); // distance value is the default Processing camera value
  camera.setMinimumDistance(0);
  camera.setMaximumDistance(2500);
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
  cowTexture = loadImage("cowFur.jpg"); // image from https://milkgenomics.org/wp-content/uploads/2013/08/bigstock-dairy-cow-fur-skin-backgroun-40931641.jpg
  
  treeShape = loadShape("treeShape.obj"); // file from https://free3d.com/3d-model/low-poly-tree-73217.html
  NULL = loadImage("NULL.png"); // image is an unused placeholder to allow for setFill()
  
}

void initializeShapes() {
  shapes = new ArrayList<Shape>();
  for (int i = 0; i < sliders[0].totalScore * 60; i++) {
    shapes.add(new Shape(radius));
  }
}

// ---------------------------------------------------
void rotatePlanet() {
  pushMatrix();
    translate(width/2, height); 
      rotateZ(zRotation);
        rotateY(yRotation); 
          shape(planetSphere);
  popMatrix();
  
  yRotation -= 0.01;
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
    
    if (sliders[0].checkIfHovering() && mousePressed) {
      sliders[0].meatScore = map(returnScore(), 47,113, 1,0);
    }
    if (sliders[1].checkIfHovering() && mousePressed) {
      sliders[0].dairyScore = map(returnScore(), 47,113, 0,1);
    }
    if (sliders[2].checkIfHovering() && mousePressed) {
      sliders[0].disposablesScore = map(returnScore(), 47,113, 0,1);
    }
    if (sliders[3].checkIfHovering() && mousePressed) {
      sliders[0].zerowasteScore = map(returnScore(), 47,113, 0,1);
    }
    if (sliders[4].checkIfHovering() && mousePressed) {
      sliders[0].upcyclingScore = map(returnScore(), 47,113, 0,1);
    }
    if (sliders[5].checkIfHovering() && mousePressed) {
      sliders[0].recyclingScore = map(returnScore(), 47,113, 0,1);
    }
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
  pushMatrix();
    translate(width/2, height/2, 0); // set back to height
      for (int i = 0; i < shapes.size(); i++) {
        Shape shape = shapes.get(i);
        int index = int(random(shapeOptions.length));
        switch (index) {
          case 0:
            shape.drawShape(PI, PI, cowShape, color(0,0,0), cowTexture, 3);
            break;
          case 1:
            shape.drawShape(PI, 0, treeShape, color(0,255,0), NULL, 7);
            break;
        }
      }
  popMatrix();
}
  
// ---------------------------------------------------
float returnScore() {
  return score = lerp(sliders[0].yPosition/2 + (sliders[0].yPosition/2 - sliders[0].sliderHeight/2), sliders[0].yPosition + sliders[0].sliderHeight/2, pmouseY/100);
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
  if (shapes.size() ==  0) { return numberOfShapes = shapeOptions.length * 100; }
  if (sliders[0].calculateImpactScore() == 0) { return numberOfShapes = 60; }
  if (sliders[0].calculateImpactScore() == 1) { return numberOfShapes = 0; }
  return numberOfShapes = int(ceil(sliders[0].calculateImpactScore() * 60));
}

void addOrRemoveShapes() {
  while (shapes.size() < howManyShapesNeeded()) {
    shapes.add(new Shape(radius));    
   }

  while (shapes.size() > howManyShapesNeeded()) {
    for (int i = shapes.size() - 1; i >= 0; i--) {
      shapes.remove(i);
    }
  }
}

// ---------------------------------------------------
void resetButton() {
  fill(255,0,0);
  pushMatrix();
  translate(width*.92, height - (width*.08));
  rect(0, 0, width*.08, width*.08, 7);
  fill(255,255,255);
  textAlign(CENTER,CENTER);
  text("RESET CAMERA", 0, 0, width*.08, width*.08);
  popMatrix();
}

void mousePressed() {
  if (pmouseX > width*.92 && pmouseY > height-(width*.08)) {
    camera.reset();
  }
}
