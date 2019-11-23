import peasy.*;

PeasyCam camera;
PShape shape1, shape2;

void setup() {
  size(1000,1000,P3D);
  camera = new PeasyCam(this, width/2, height/2, 0, 50);
  camera.setMinimumDistance(0);
  camera.setMaximumDistance(2500);
  shape1 = loadShape("cow.obj");
  shape2 = loadShape("treeObj.obj");
  shape1.setFill(color(125));
  shape2.setFill(color(255, 0 ,0));
}

void draw() {
  background(0);
  lights();

  pushMatrix();
  translate(width/2, height/2, -500);
  rotateY(radians(180));
  rotateX(radians(180));
  scale(25);
  shape(shape1,0,0);
  popMatrix();
  
  pushMatrix();
  translate(width/2 + 100, height/2, -500);
  rotateX(radians(180));
  scale(25);
  shape(shape2,0,0);
  popMatrix();
}
