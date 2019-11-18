PShape planetSphere;
PImage planetTexture;

float xRotation = 0.0;
float yRotation = 0.0;
float zRotation = 0.0;

void setup() {
  size(200,200,P3D);
  
  // initialize planet
  noStroke();
  planetSphere = createShape(SPHERE, height/2);
  planetTexture = loadImage("planetTexture copy.png");
  planetSphere.setTexture(planetTexture);
  
}

void draw() {
  pushMatrix();
    translate(width/2, height); 
      rotateY(yRotation);
      rotateX(xRotation); 
      rotateZ(zRotation);
      shape(planetSphere);
  popMatrix();
  zRotation += 0.01;
}

void keyPressed() {
  if (keyCode == UP) { yRotation++; println(yRotation); }
  if (keyCode == RIGHT) { xRotation++; println(xRotation); }
  if (keyCode == LEFT) { zRotation++; println(zRotation); }
}
