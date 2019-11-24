import peasy.*;

PeasyCam camera;

PVector vector1, vector2;

int radius = 50;
int dimension = 20;

float[] yAngle = new float[2];
float[] zAngle = new float[2];
float[] xPosition = new float[2];
float[] yPosition = new float[2];
float[] zPosition = new float[2];

void setup() {
  size(640,400,P3D);
  
  for (int i = 0; i < 1; i++) {
  yAngle[i] = (random(TWO_PI));
  zAngle[i] = (random(PI));
  xPosition[i] = (radius*sin((zAngle[i]))*cos((yAngle[i])));
  yPosition[i] = (radius*sin((zAngle[i]))*sin((yAngle[i])));
  zPosition[i] = (radius*cos((zAngle[i])));
  }

  vector1 = new PVector(xPosition[0], yPosition[0]);
  vector2 = new PVector(xPosition[1], yPosition[1]);
  PVector center = new PVector (width/2, height/2);
  vector1.sub(center);
  vector1.normalize();
  vector1.mult(radius);
  vector2.sub(center);
  vector2.normalize();
  vector2.mult(radius);
  
  camera = new PeasyCam(this, width/2.0, height/2.0, 0, (height/2.0) / tan(PI*60.0 / 360.0));
  camera.setMinimumDistance(0);
  camera.setMaximumDistance(450);
}

void draw() {
  background(0);
  pushMatrix();
    translate(width/2, height/2, 0);
    stroke(255,255,255);
    
    noFill();   
    //ellipseMode(CENTER);
    sphere(radius);
    
    stroke(255,0,0);
    line(0,0,vector1.x*2,vector1.y*2);
    stroke(0,0,255);
    line(0,0,vector2.x*2,vector2.y*2);
    
    pushMatrix();
      rotateX(cos(vector1.heading()));
      rotateY(sin(vector1.heading())); 
      rotateZ(atan(vector1.heading()));
      translate(radius*1.25*sin(vector1.y)*cos(vector1.x), radius*1.25*sin(vector1.y)*sin(vector1.x), radius*1.25*cos(vector1.y));
      //rectMode(CENTER);
      noStroke();
      fill(0,255,0);
      box(dimension);
    popMatrix();
    pushMatrix();
      rotateX(cos(vector2.heading()));
      rotateY(sin(vector2.heading())); 
      rotateZ(atan(vector2.heading()));
      translate(radius*1.25*sin(vector2.y)*cos(vector2.x), radius*1.25*sin(vector2.y)*sin(vector2.x), radius*1.25*cos(vector2.y));
      //rectMode(CENTER);
      noStroke();
      fill(0,255,0);
      box(dimension);
    popMatrix();
  popMatrix();
}
