import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;
import java.lang.*;

String prefix = "fireball/all/";  
boolean left;
boolean right;
boolean up;
int counter;
ArrayList<Smoke_Shot> smokeShot;
ArrayList<PImage> fire;

ArrayList<Box> boxes;
PImage bg;
PImage s0000;

Box2DProcessing box2d;
Delsin delsin;
Ground ground;
Smoke s;

void setup() {
  //Basics
  size(750, 500);
  bg= loadImage("High Up.jpg");  
  bg.loadPixels();

  smooth();
  boxes = new ArrayList<Box>();
  
//  //loop fire
//  fire = new ArrayList<PImage>();
//  for(int i=45;i<63;i++){
//    fire.add(loadImage(prefix+nf(i,4)+".png"));
//  }

  //Box2d stuff
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,-60);
  //box2d.listenForCollisions();


  delsin = new Delsin(550,330);
  ground = new Ground(375,450,750,100);


}

  void keyPressed() {
      if(key=='w'){
        up=true;
      }
      if(key=='a'){
        left=true;
      }
      if(key=='d'){
        right=true;
      }
//      if(key=='s'){
//        Delsin.bd.applyForceToCenter(new Vec2(0,-15));
//      }       
  }
  
  void keyReleased(){      
    if(key=='w'){
      up=false;
    }
    if(key=='a'){
      left=false;
      counter=0;
    }
    if(key=='d'){
      right=false;
      counter=0;
    }
//    if(key=='s'){        
//    }             
  }

//  void mousePressed(){
//    delsin.shoot(); 
//    
//  }

void draw() {
  image(bg, 0, 0, 750, 500);
  box2d.step();
  delsin.display();
  delsin.move();

  ground.display();

  //cursor(CROSS);
  if (mousePressed) {
    if(mouseButton==LEFT)
      delsin.shoot(mouseX,mouseY);
    else if(mouseButton==RIGHT){
      Box p = new Box(mouseX,mouseY);
      boxes.add(p);
    }
  }

  for(Smoke_Shot bullets: smokeShot){
    bullets.display(box2d.vectorPixelsToWorld(bullets.bd.getPosition())); 
  }
  // Display all the boxes
  for (Box b: boxes) {
    b.display();
  }
}
