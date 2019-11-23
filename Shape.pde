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
  int filling;
  
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
  float get_xPosition() {
    return xPosition = radius * cos(random(-2*PI, PI)) * sin(random(-2*PI, PI));
  }
  
  float get_yPosition() {
    return yPosition = radius * sin(random(-2*PI, PI)) * sin(random(-2*PI, PI));
  }
  
  float get_zPosition() {
    return zPosition = radius * cos(random(-2*PI, PI));
  }
  
  // ---------------------------------------------------
  void drawShape(float xRot, float yRot, PShape obj, int fill, PImage image, int mag) {
    xRotation = xRot;
    yRotation = yRot;
    shape = obj;
    texture = image;
    filling = fill;
    scale = mag;
    
    pushMatrix();
      translate(get_xPosition(), get_yPosition(), get_zPosition());
      rotateX(xRotation + get_xPosition());
      rotateY(yRotation + get_yPosition());
      scale(scale);
        shape(shape, 0, 0);
        if (texture == NULL) {
          shape.setFill(filling);
        } else { 
          shape.setTexture(texture); 
        }
    popMatrix();
  }
  
} // end of Shape Class
