import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;
import java.lang.*;

String prefix = "fireball/all/";  
boolean left;
boolean right;
ArrayList<PImage> fire;

ArrayList<Box> boxes;
PImage bg;
PImage s0000;
Delsin delsin;

Box2DProcessing box2d;
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
  box2d.setGravity(0,-10);
  //box2d.listenForCollisions();

  delsin = new Delsin(550,330);
  ground = new Ground(375,450,750,100);
  image(bg,0,0,750,500);
  saveFrame("s0000.png");
  s0000 = loadImage("s0000.png");
  s0000.loadPixels();


}

  void keyPressed() {
      if(key=='w'){
      }
      if(key=='a'){
        left=true;
      }
      if(key=='d'){
        right=true;
      }
      if(key=='s'){
      }       
  }
  
  void keyReleased(){      
    if(key=='w'){
    }
    if(key=='a'){
      left=false;
    }
    if(key=='d'){
      right=false;
    }
    if(key=='s'){        
    }             
  }

void draw() {
  image(bg, 0, 0, 750, 500);
  box2d.step();    
  delsin.display();
  ground.display();


  // When the mouse is clicked, add a new Box object
  if (mousePressed) {
    Box p = new Box(mouseX,mouseY);
    boxes.add(p);
  }

  // Display all the boxes
  for (Box b: boxes) {
    b.display();
  }
}


