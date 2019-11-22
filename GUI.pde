import peasy.*;

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
int typesOfShapes = 1;
int numberOfShapes;
PShape cowShape;
PImage cowFur;

void setup() {
  //fullScreen(P3D);
  size(640, 400, P3D);
  radius = height/2;
  initializeOverloadedSliders();
  initializePlanet();
  initializeShapes();
  initializeObjectsAndImages();
  drawShapes();
}

void draw() {
  background(#060115); // dark blue/purple
  //rotatePlanet();
  drawSliders();
  drawLabels();
  drawSliderPieces();
  
  //sliders.get(0);
  shape(cowShape, sliders.get_xPosition(), sliders.get_yPosition());
  
  fill(255,255,255);
  translate(0,height-40,0);
  rect(0,0, 40,40);
  fill(0,0,0);
  textSize(15);
  text(pmouseX, 15, 10);
  text(pmouseY, 15, 30);
  
}

// ==================================================
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

void initializeShapes() {
  shapes = new ArrayList<Shape>();
  for (int i = 0; i < sliders[0].totalScore * 10; i++) {
    shapes.add(new Shape(radius));
  }
}

void initializeObjectsAndImages() {
  cowShape = loadShape("cowShape.obj");  // file from https://free3d.com/3d-model/cow-v4--997323.html
  cowFur = loadImage("cowFur.jpg"); // image from https://milkgenomics.org/wp-content/uploads/2013/08/bigstock-dairy-cow-fur-skin-backgroun-40931641.jpg
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
  for (Shape shapes : shapes) {
    shapes.drawShape(cowShape);
  }
}
  
// ---------------------------------------------------
float returnScore() {
  return score = lerp(sliders[0].yPosition/2 + (sliders[0].yPosition/2 - sliders[0].sliderHeight/2), sliders[0].yPosition + sliders[0].sliderHeight/2, pmouseY/100);
}

int howManyShapesToCreate() {
  if (shapes.size() ==  0) { return numberOfShapes = typesOfShapes * 10; }
  return numberOfShapes = int(ceil(sliders[0].impactScore * 10));
}

 void addShapes() {
  shapes.add(new Shape(radius));    
}

void removeShapes() {
  for (int i = shapes.size() - 1; i >= 0; i--) {
    shapes.remove(i);
  }
}
