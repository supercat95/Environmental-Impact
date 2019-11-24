PVector vector;

int radius = 100;
int dimension = 20;

void setup() {
  size(640,400);
  vector = new PVector(0,0);
  PVector center = new PVector (width/2, height/2);
  vector.sub(center);
  vector.normalize();
  vector.mult(radius);
}

void draw() {
  background(0);
  pushMatrix();
    translate(width/2, height/2);
    stroke(255,255,255);
    noFill();
    
    ellipseMode(CENTER);
    ellipse(0,0,radius,radius);
    
    line(0,0,vector.x,vector.y);
    rotate(vector.heading());
    rectMode(CENTER);
    rect(radius*1.5*sin(vector.y)*cos(vector.x), radius*1.5*sin(vector.y)*sin(vector.x),20,20);
  popMatrix();
}
