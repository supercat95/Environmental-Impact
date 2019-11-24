import peasy.*;

PeasyCam camera;

PVector vector;

int radius = 50;
int dimension = 20;

void setup() {
  size(640,400,P3D);
  vector = new PVector(0,0);
  PVector center = new PVector (width/2, height/2);
  vector.sub(center);
  vector.normalize();
  vector.mult(radius);
  
  camera = new PeasyCam(this, width/2.0, height/2.0, 0, (height/2.0) / tan(PI*60.0 / 360.0));
  camera.setMinimumDistance(0);
  camera.setMaximumDistance(450); // 350
}

void draw() {
  background(0);
  pushMatrix();
    translate(width/2, height/2, 0);
    stroke(255,255,255);
    noFill();
    
    ellipseMode(CENTER);
    ellipse(0,0,radius,radius);
    noFill();
    sphere(radius);
    
    stroke(255,0,0);
    line(0,0,vector.x*2,vector.y*2);
    
    rotateX(cos(vector.heading()));
    rotateY(sin(vector.heading()));
    rotateZ(atan(vector.heading()));
    translate(radius*1.25*sin(vector.y)*cos(vector.x), radius*1.25*sin(vector.y)*sin(vector.x), radius*1.25*cos(vector.y));
    noStroke();
    fill(0,255,0);
    box(dimension); 
  popMatrix();
}
