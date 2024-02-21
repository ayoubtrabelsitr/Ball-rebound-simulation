PVector gravity  = new PVector(0, 9.8, 0);
PVector randomForce, frictionForce;
PVector deceleration; //La deceleration causé par la friction
float maxForce = 50;
float angleRebound, frictionCoeff = 0.6; //Angle de rebond et la coefficient de friction
float dragCoefficient = 0.004, airDensity = 1.2; //Coefficient de resistance à l'air et la densite
boolean boundaryHit = false;
//Les Normales pour chaque face
PVector Down = new PVector(0, 1, 0);
PVector Up = new PVector(0, -1, 0);
PVector Left = new PVector(1, 0, 0);
PVector Right = new PVector(-1, 0, 0);
PVector Front = new PVector(0, 0, 1);
PVector Back = new PVector(0, 0, -1);

import peasy.*;

PeasyCam cam;
Box box;
Ball ball;

void setup(){
  size(1280, 720, P3D);
  cam = new PeasyCam(this, 1000);
  cam.setMinimumDistance(240);
  cam.setMaximumDistance(2000);
  
  ball = new Ball(new PVector(0, 10, 0), new PVector(10, 10, 10), 40, 10);
  box = new Box();
}


void draw(){
  background(0);
  lights();
  directionalLight(200, 200, 200, 1, 1, 0);
  ball.create();
  box.create();
  ball.move();
  ball.boundaryCollision(box);
  ball.keyPressed();
}
