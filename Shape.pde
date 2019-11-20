class Shape {
  float xPosition;
  float yPosition;
  float zPosition;
  float xRotation;
  float yRotation;
  float zRotation;
  float radius;
  
  PShape shape;
  PImage texture;
  
  Shape(float planetRadius) {
    xPosition = 0;
    yPosition = 0;
    zPosition = 0;
    xRotation = 0;
    yRotation = 0;
    zRotation = 0;
    radius = planetRadius;
  }
  
  // ==================================================
  // math equations from https://stackoverflow.com/questions/969798/plotting-a-point-on-the-edge-of-a-sphere
  void set_xPosition() {
    xPosition = radius * cos(zRotation) * sin(yRotation);
  }
  
  float get_xPosition() {
    return xPosition;
  }
  
  void set_yPosition() {
    yPosition = radius * sin(zRotation) * sin(yRotation);
  }
  
  float get_yPosition() {
    return yPosition;
  }
  
  void set_zPosition() {
    zPosition = radius * cos(zRotation);
  }
  
  void get_zPosition() {
    return zPosition;
  }
  
  // ---------------------------------------------------
  void drawShape(PShape pshape) {
    shape = pshape;
    this.shape(shape, get_xPosition(), get_yPosition(), get_zPosition());
    shape.setTexture(determineTexture());
  }

  void determineTexture() {
    if (shape == "cowShape.obj") { texture = "cowFur.jpg"; }
  }
  
} // end of Shape Class
