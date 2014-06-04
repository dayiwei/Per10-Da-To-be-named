import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;


Vec2 gravity = new Vec2(0.0f, -10.0f);

ArrayList<PImage> fire;
String prefix = "fireball/all/";
int num = 1;




void setup(){
  size(750,500);
  PImage background = loadImage("High Up.jpg");  
  image(background,0,0,750,500);
  
  Box2DProcessing box2d = new Box2DProcessing(this);
  box2d.createWorld(gravity);
  Vec2 center = box2d.coordPixelsToWorld(width/2,height/2);

  
  fire = new ArrayList<PImage>();
  for(int i=45;i<63;i++){
    fire.add(loadImage(prefix+nf(i,4)+".png"));
  } 
  
  
  
}
 



void draw(){

  image(fire.get(num%10),50,50);
  num++;

  
}

