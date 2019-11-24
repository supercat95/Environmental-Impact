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
  
  float scale;

  Shape(float planetRadius) {
    radius = planetRadius;
    
    int option = int(random(shapeOptions.length));
    switch(option) {
    case 0: 
      shape = cowShape; 
      filling = (color(255, 255, 255)); 
      texture = NULL; //cowTexture; 
      this.scale = 3; //3
      xRotation = HALF_PI;
      //yRotation = PI;
      break;
    case 1:
      shape = treeShape; 
      filling = (color(0, 255, 0)); 
      texture = NULL; 
      this.scale = 7; //7
      xRotation = HALF_PI;
      //yRotation = 0;
      break;
    case 2:
      shape = turtleShape; 
      filling = (color(#84890B)); 
      texture = NULL;//turtleTexture; 
      this.scale = .3; //.3
      //xRotation = PI/2;
      //yRotation = 0;
      break;
    }
    
    if (texture == NULL) {
      shape.setFill(filling);
    } else { 
      shape.setTexture(texture);
    }
    
    yAngle = random(TWO_PI); 
    zAngle = random(PI);
    xPosition = radius * sin(zAngle) * cos(yAngle);
    yPosition = radius * sin(zAngle) * sin(yAngle);
    zPosition = radius * cos(zAngle);
  }
  
  // ==================================================
  void drawShape() {
    pushMatrix();
      translate(this.xPosition, this.yPosition, this.zPosition);
      
      PVector vector = new PVector(xPosition-0, yPosition-0, zPosition-0);
      float rho = sqrt(pow(vector.x, 2)+pow(vector.y, 2)+pow(vector.z, 2));
      float phi = acos(vector.z / rho);
      float the = atan2(vector.y, vector.x);
      vector.mult(0.5);
      
      rotateZ(the);
      rotateY(phi);
      // shape-specific rotation
      rotateX(xRotation);
      if (shape == cowShape || shape == treeShape) { translate(0, 15, 0); }
      
      scale(this.scale);
        shape(this.shape);
        if (texture == NULL) {
          shape.setFill(filling);
        } else { 
          shape.setTexture(texture); 
        }
    popMatrix();
  }
  
} // end of Shape Class
