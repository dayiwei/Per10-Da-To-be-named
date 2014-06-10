import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;

int counter;
Vec2 gravity = new Vec2(0.0f, -10.0f);

PImage tile;


Box2DProcessing box2d;
Ground ground;

void setup(){
  //Basics
  size(750,500);
  PImage background = loadImage("High Up.jpg");  
  image(background,0,0,750,500);
  counter = 1;
  
  //Box2d stuff
  box2d = new Box2DProcessing(this);
  box2d.createWorld(gravity);

  ground = new Ground(0,height-100,500);
  

  tile = loadImage("Tiles/PNGs/Ground/Stone-1.png");
  for(int i=1;i<3;i++){
    for(int j=0;j<15;j++){
      image(tile,50*j,height-50*i,50,50);      
    }
  }
  image(tile,0,height-50,50,50);
 
}
 



void draw(){

  box2d.step();  


  
}

