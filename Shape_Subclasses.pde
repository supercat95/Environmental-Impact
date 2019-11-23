class Cow extends Shape {
  Cow() {
    xRotation = PI;
    YRotation = PI;
    shape = cowShape;
    texture = cowFur;
  }
  
  void drawCow() {
    pushMatrix();
      translate(0, 0, get_zPosition());
      rotateX(xRotation);
      rotateY(yRotation);
        shape(shape, get_xPosition(), get_yPosition());
        shape.setTexture(texture);
    popMatrix();
  }
} // end of Cow subclass

class Tree extends Shape {
  Tree() {
    xRotation = PI;  
    shape = treeShape;
  }
  
} // end of Tree subclass

class Fire extends Tree {
  
} // end of Fire subclass 2.0

class Plastic extends Shape {
  
} // end of Plastic subclass
