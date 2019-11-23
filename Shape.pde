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
  
  int selection;
  Cow cow = new Cow();
  Tree tree = new Tree();
  
  float rotateX;
  float rotateY;
  int scale;
  
  Shape() {
    xPosition = 0;
    yPosition = 0;
    zPosition = 0;
    xRotation = 0;
    yRotation = 0;
    zRotation = 0;
    radius = 0;
  }
  
  Shape(float planetRadius) {
    set_xPosition();
    set_yPosition();
    set_zPosition();
    xPosition = get_xPosition();
    yPosition = get_yPosition();
    zPosition = get_zPosition();
    xRotation = 0.0;
    yRotation = 0.0;
    zRotation = 0.0;
    radius = planetRadius;
    rotateX = 0.0;
    rotateY = 0.0;
    scale = 1;
  }
  
  // ==================================================
  // math equations from https://stackoverflow.com/questions/969798/plotting-a-point-on-the-edge-of-a-sphere
  void set_xPosition() {
    xPosition = radius * cos(random(-2*PI, PI)) * sin(random(-2*PI, PI));
  }
  
  float get_xPosition() {
    return xPosition;
  }
  
  void set_yPosition() {
    yPosition = radius * sin(random(-2*PI, PI)) * sin(random(-2*PI, PI));
  }
  
  float get_yPosition() {
    return yPosition;
  }
  
  void set_zPosition() {
    zPosition = radius * cos(random(-2*PI, PI));
  }
  
  float get_zPosition() {
    return zPosition;
  }
  
  // ---------------------------------------------------
  void drawShape() {
    //pushMatrix();
    //  translate(get_xPosition(), get_yPosition(), get_zPosition());
    //  rotateX(xRotation);
    //  rotateY(yRotation);
    //    shape(shape, 0, 0);
    //    shape.setTexture(texture);
    //popMatrix();
    cow.drawCow();
  }
  
  void selectSubclass() {
    if (selection == 0) { cow.drawCow(); }
  }
 
  // ---------------------------------------------------
  
} // end of Shape Class
