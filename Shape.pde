class Shape {
  float xPosition;
  float yPosition;
  float zPosition;
  float xRotation;
  float yRotation;
  float zRotation;
  float radius;
  float yAngle;
  float zAngle;
  
  PShape shape;
  PImage texture;
  int filling;
  
  float rotateX;
  float rotateY;
  float scale;
  
  PVector vector;
  float xTheta;
  float yTheta;
  float zTheta;
  
  Shape() {
    xPosition = 0;
    yPosition = 0;
    zPosition = 0;
    xRotation = 0;
    yRotation = 0;
    zRotation = 0;
    radius = 0;
    yAngle = 0.0;
    zAngle = 0.0;
  }
  
  Shape(float planetRadius) {
    xPosition = get_xPosition();
    yPosition = get_yPosition();
    zPosition = get_zPosition();
    xRotation = 0.0;
    yRotation = 0.0;
    zRotation = 0.0;
    radius = planetRadius;
    yAngle = 0.0;
    zAngle = 0.0;
    rotateX = 0.0;
    rotateY = 0.0;
    scale = 1;
  }
  
  // ==================================================
  void randomizeAngles() {
    yAngle = random(0, 2*PI);
    zAngle = random(0, 2*PI);
  }
  
  float get_yAngle() {
    return yAngle;
  }
  
  float get_zAngle() {
    return zAngle;
  }
  
  // math equations from https://stackoverflow.com/questions/969798/plotting-a-point-on-the-edge-of-a-sphere
  float get_xPosition() {
    randomizeAngles();
    return xPosition = radius * cos(get_zAngle()) * sin(get_yAngle());
  }
  
  float get_yPosition() {
    randomizeAngles();
    return yPosition = radius * sin(get_zAngle()) * sin(get_yAngle());
  }
  
  float get_zPosition() {
    randomizeAngles();
    return zPosition = radius * cos(get_yAngle());
  }
  
  void performVectorMath() {
    float rx = get_xPosition() / sqrt(sq(get_xPosition()) + sq(get_xPosition()) + sq(get_xPosition()));
    float ry = get_yPosition() / sqrt(sq(get_xPosition()) + sq(get_xPosition()) + sq(get_xPosition()));
    float rz = get_yPosition() / sqrt(sq(get_xPosition()) + sq(get_xPosition()) + sq(get_xPosition()));
    xTheta = asin(rx);
    yTheta = asin(ry);
    zTheta = asin(rz);
    //vector = new PVector(this.get_xPosition(), this.get_yPosition(), this.get_zPosition());
    //vector.mult(radius);
    //return vector.heading();
  }
  
  float get_xTheta() {
    return xTheta;
  }
  
  float get_yTheta() {
    return yTheta;
  }
  
  float get_zTheta() {
    return zTheta;
  }
  
  // ---------------------------------------------------
  void drawShape(float xRot, float yRot, PShape obj, int fill, PImage image, float mag) {
    xRotation = xRot;
    yRotation = yRot;
    shape = obj;
    texture = image;
    filling = fill;
    scale = mag;
    
    pushMatrix();
      translate(get_xPosition(), get_yPosition(), get_zPosition());
      performVectorMath();
      rotateX(get_xTheta() * xRotation);
      rotateY(get_yTheta() * yRotation);
      rotateZ(get_zTheta() * zRotation);
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
