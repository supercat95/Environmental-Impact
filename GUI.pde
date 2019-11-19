import peasy.*;

Slider[] sliders = new Slider[6];
float xIncrement = 0;
float yIncrement;

String[] labels = {"Meat Consumption", "Dairy Consumption", "Plastic Use", "Disposables Use", "Recycling and Upcycling", "Proper Recycling"};

PShape planetSphere;
PImage planetTexture;

float yRotation = 1.0;
float zRotation = 23;

void setup() {
  //fullScreen(P3D);
  size(640, 400, P3D);
  initializeOverloadedSliders();
  initializePlanet();
}

void draw() {
  background(#060115); // dark blue/purple
  rotatePlanet();
  drawSliders();
  drawLabels();
  drawSliderPieces(); 
  
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
  planetSphere = createShape(SPHERE, height/2);
  planetTexture = loadImage("planetTexture.png");
  planetSphere.setTexture(planetTexture);
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
      sliders[0].meatScore = pmouseY / 100.0;
    }
    if (sliders[1].checkIfHovering() && mousePressed) {
      sliders[0].dairyScore = pmouseY / 100.0;
    }
    if (sliders[2].checkIfHovering() && mousePressed) {
      sliders[0].plasticScore = pmouseY / 100.0;
    }
    if (sliders[3].checkIfHovering() && mousePressed) {
      sliders[0].disposablesScore = pmouseY / 100.0;
    }
    if (sliders[4].checkIfHovering() && mousePressed) {
      sliders[0].upcyclingScore = (pmouseY - (sliders[0].yPosition / 2)) / 100;
    }
    if (sliders[5].checkIfHovering() && mousePressed) {
      sliders[0].recyclingScore = (pmouseY - (sliders[0].yPosition / 2)) / 100;
    }
  }
  println(sliders[0].calculateImpactScore());
}

void drawLabels() {
  for (int i = 0; i < sliders.length; i++) {
      fill(255,255,255);
      textSize(width/80);
      textAlign(CENTER);
      text(labels[i], sliders[i].xPosition + width/12, sliders[i].sliderHeight + sliders[i].yPosition);
  }
}

// ---------------------------------------------------
