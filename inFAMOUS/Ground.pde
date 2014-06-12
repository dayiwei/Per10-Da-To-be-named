class Ground {

  float x, y, w,h;
  PImage tile;
  Body ground;

  Ground(float x, float y, float w,float h) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    tile = loadImage("Tiles/PNGs/Ground/Stone-1.png");
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    ground = box2d.createBody(bd);

    PolygonShape ps = new PolygonShape();
    ps.setAsBox(box2d.scalarPixelsToWorld(w/2), box2d.scalarPixelsToWorld(h/2));

    ground.createFixture(ps,1);
  }

  void display() {

    for(int i=1; i<3; i++) {
      for(int j=0; j<15; j++) {
        image(tile, 50*j, height-50*i, 50, 50);
      }
    }    
  }


//for testing  
//  void display() {
//    fill(0);
//    stroke(0);
//    rectMode(CENTER);
//    rect(x,y,w,h);
//  }
}

