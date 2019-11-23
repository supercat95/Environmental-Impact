import peasy.*;

PeasyCam camera;
PShape shape1, shape2, shape3, shape4;
PImage texture1, texture2;

void setup() {
  size(1000,1000,P3D);
  camera = new PeasyCam(this, width/2, height/2, 0, 50);
  camera.setMinimumDistance(0);
  camera.setMaximumDistance(2500);
  shape1 = loadShape("cow.obj");
  shape2 = loadShape("treeObj.obj");
  shape3 = loadShape("trashShape.obj");
  shape4 = loadShape("turtleShape.obj");
  texture1 = loadImage("cowFur.jpg");
  texture2 = loadImage("turtleTexture.jpg");
  shape1.setFill(color(125));
  shape1.setTexture(texture1);
  shape2.setFill(color(255, 0 ,0));
  shape3.setFill(#585252);
  //shape4.setFill(color(0,0,0));
  shape4.setTexture(texture2);
}

void draw() {
  background(0);
  lights();

  // cow
  pushMatrix();
  translate(width/2, height/2, -500);
  rotateY(radians(180));
  rotateX(radians(180));
  scale(25);
  shape(shape1,0,0);
  popMatrix();
  
  // tree
  pushMatrix();
  translate(width/2 + 100, height/2, -500);
  rotateX(radians(180));
  scale(25);
  shape(shape2,0,0);
  popMatrix();
  
  // trash can
  pushMatrix();
  translate(width/2 - 100, height/2, -500);
  rotateX(PI/2);
  scale(25);
  shape(shape3,0,0);
  popMatrix();
  
  // turtle
  pushMatrix();
  translate(width/2 - 200, height/2, -500);
  rotateX(PI/2);
  scale(2);
  shape(shape4,0,0);
  popMatrix();
}
