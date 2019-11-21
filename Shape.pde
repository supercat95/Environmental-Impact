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
  
  float get_zPosition() {
    return zPosition;
  }
  
  // ---------------------------------------------------
  void drawShape(PShape pshape) {
    shape = pshape;
    pushMatrix();
      translate(0, 0, get_zPosition());
        shape(shape, get_xPosition(), get_yPosition());
        shape.setTexture(determineTexture());
    popMatrix();
  }

  PImage determineTexture() {
    if (shape == cowShape) { return cowFur; }
    return cowFur;
  }
  
  // ---------------------------------------------------
  void addShapes() {
    shapes.add(new Shape(radius));    
  }
  
  void removeShapes() {
    for (int i = shapes.size() - 1; i >= 0; i--) {
      shapes.remove(i);
    }
  }
  
} // end of Shape Class
