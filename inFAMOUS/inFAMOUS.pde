import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;


Vec2 gravity = new Vec2(0.0f, -10.0f);

BodyDef groundBodyDef = new BodyDef();



void setup(){
  size(750,500);
  PImage background = loadImage("High Up.jpg");  
  image(background,0,0,750,500);


  Box2DProcessing box2d = new Box2DProcessing(this);
  box2d.createWorld(gravity);
  Vec2 center = box2d.coordPixelsToWorld(width/2,height/2);
  groundBodyDef.position.set(center);
  Body body = box2d.createBody(groundBodyDef);
  

//  File dir = new File(new File("fireball"), "all");
//  PImage smoke = loadImage(new File(dir,"0001.png").getAbsolutePath());
//  image(smoke,0,0);
  
  
}


void draw(){
  
}

