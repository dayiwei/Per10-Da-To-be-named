import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;

int counter;
Vec2 gravity = new Vec2(0.0f, -10.0f);



Box2DProcessing box2d;
Ground ground;

void setup() {
  //Basics
  size(750, 500);
  PImage background = loadImage("High Up.jpg");  
  image(background, 0, 0, 750, 500);
  counter = 1;

  //Box2d stuff
  box2d = new Box2DProcessing(this);
  box2d.createWorld(gravity);

  ground = new Ground(0, height-100, 500);
  ground.display();
}



void draw() {

  box2d.step();
}

