class Cow extends Shape {
  Cow() {
    xRotation = PI;
    yRotation = PI;
    scale = 5;
    shape = cowShape;
    texture = cowTexture;   
  }
  
  //void drawCow() {
  //  pushMatrix();
  //    translate(get_xPosition(), get_yPosition(), get_zPosition());
  //    rotateX(xRotation);
  //    rotateY(yRotation);
  //    scale(scale);
  //      shape(shape, 0, 0);
  //      shape.setTexture(texture);
  //  popMatrix();
  //}
} // end of Cow subclass

class Tree extends Shape {
  Tree() {
    xRotation = PI;  
    scale = 5;
    shape = treeShape;
  }
  
} // end of Tree subclass

class Fire extends Tree {
  
} // end of Fire subclass 2.0

class Plastic extends Shape {
  
} // end of Plastic subclass
