class Slider {
  float sliderLength;
  float sliderHeight;
  
  float xPosition;
  float yPosition;
  float zPosition;
  
  Slider() {
    sliderLength = width / 45;
    sliderHeight = height / 6;
    xPosition = 0;
    yPosition = 0;
    zPosition = 0;
  }
  
  Slider(float xPos) {
    sliderLength = width / 45;
    sliderHeight = height / 6;
    xPosition = xPos;
    yPosition = height / 5;
    zPosition = 0;
  }
  
  // ==================================================
  
  void createSlider() {
    pushMatrix();
      translate(xPosition, yPosition, zPosition);
      fill(255,255,255);
      box(sliderLength, sliderHeight, 15);
    popMatrix();
  }
  
} // end of Slider class
