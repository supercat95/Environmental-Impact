class Slider {
  float sliderLength;
  float sliderHeight;
  float xPosition;
  float yPosition;
  float zPosition;
  
  float pieceLength;
  float pieceHeight;
  float yPos;
   
  boolean isDragged;
  
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
    
    pieceLength = 5 * sliderLength / 4;
    pieceHeight = sliderHeight / 8;
    yPos = yPosition;
    
    isDragged = false;
  }
  
  // ==================================================
  
  void createSlider() {
    pushMatrix();
      translate(xPosition, yPosition, zPosition);
      fill(255,255,255);
      box(sliderLength, sliderHeight, 15);
    popMatrix();
  }
  
  void sliderPiece(float y) {
    yPos = y;
    pushMatrix();
      translate(xPosition, yPos, zPosition);
      fill(#FFF700); // yellow
      box(pieceLength, pieceHeight, 22);
    popMatrix();
  }
  
} // end of Slider class
