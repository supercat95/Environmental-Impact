import peasy.*;

PeasyCam camera;
PShape shape;
PImage image;

void setup() {
  size(400,400,P3D);
  scale(500,500);
  //camera = new PeasyCam(this, width/2, height/2, 0, 50);
  shape = loadShape("lowpolytree.obj");
  //shape.setTexture(image);
}

void draw() {
  lights();
  shape(shape,width/2,height);
}
