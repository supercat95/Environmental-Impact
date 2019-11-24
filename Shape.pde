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
  
  PVector vector;
  
  Shape(float planetRadius) {
    radius = planetRadius;
    
    int option = int(random(shapeOptions.length));
    switch(option) {
    case 0: 
      shape = cowShape; 
      filling = (color(255, 255, 255)); 
      texture = NULL;//cowTexture; 
      this.scale = 3; //3
      xRotation = PI;
      yRotation = PI;
      break;
    case 1:
      shape = treeShape; 
      filling = (color(0, 255, 0)); 
      texture = NULL; 
      this.scale = 7; //7
      xRotation = PI;
      yRotation = 0;
      break;
    case 2:
      shape = turtleShape; 
      filling = (color(#84890B)); 
      texture = NULL;//turtleTexture; 
      this.scale = .3; //.3
      xRotation = PI/2;
      yRotation = 0;
      break;
    }
    
    if (texture == NULL) {
      shape.setFill(filling);
    } else { 
      shape.setTexture(texture);
    }

    yAngle = (random(TWO_PI));
    zAngle = (random(PI));
    this.xPosition = (radius*sin((zAngle))*cos((yAngle)));
    this.yPosition = (radius*sin((zAngle))*sin((yAngle)));
    this.zPosition = (radius*cos((zAngle)));
    
    vector = new PVector(0,0);
    PVector center = new PVector(width/2, height/2);
    vector.sub(center);
    vector.normalize();
    vector.mult(radius);
  }
  
  // ==================================================
  void drawShape() {
    pushMatrix();
      translate(this.xPosition, this.yPosition, this.zPosition);
      rotateX(xRotation);
      rotateY(yRotation);
      //rotateX(cos(this.vector.heading()));
      //stroke(255,0,0);
      //line(0,0,vector.x*2, vector.y*2);
      //rotateY(sin(this.vector.heading()));
      //rotateZ(atan(this.vector.heading()));
      //translate(radius*sin(vector.y)*cos(vector.x), radius*sin(vector.y)*sin(vector.x), radius*cos(vector.y));
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
