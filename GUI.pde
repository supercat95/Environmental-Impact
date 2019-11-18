import peasy.*;

Slider[] sliders = new Slider[6];
float xIncrement = 0;
float yIncrement;

String[] labels = {"Meat Consumption", "Dairy Consumption", "Plastic Use", "Disposables Use", "Recycling and Upcycling", "Proper Recycling"};

void setup() {
  fullScreen(P3D);
  initializeOverloadedSliders();
}

void draw() {
  background(#060115); // dark blue/purple
  drawEarth();
  drawSliders();
  drawLabels();
}

// ==================================================
void initializeOverloadedSliders() { 
  for (int i = 0; i < sliders.length; i++) {
    xIncrement = width/12 + xIncrement;
    sliders[i] = new Slider(xIncrement);
    xIncrement = width/20 + xIncrement;
  }
}

void drawSliders() {
  pushMatrix();
    translate(width/12,0,0);
  for (int i = 0; i < sliders.length; i++) {
    sliders[i].createSlider();
  }
  popMatrix();
}

void drawLabels() {
  for (int i = 0; i < sliders.length; i++) {
      fill(255,255,255);
      textSize(17);
      textAlign(CENTER);
      text(labels[i], sliders[i].xPosition + width/12, sliders[i].sliderHeight + sliders[i].yPosition);
  }
}

void drawEarth() {
  fill(0,255,0); // add an earthy texture
  noStroke();
  pushMatrix();
    translate(width/2, height);
    sphere(height/2);
  popMatrix();
}
