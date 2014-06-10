class Ground {

  float x, y, w;
  PImage tile;
  BodyDef bd;
  Body ground;

  Ground(float x, float y, float w) {
    this.x=x;
    this.y=y;
    this.w=w;
    tile = loadImage("Tiles/PNGs/Ground/Stone-1.png");
    bd = new BodyDef();
    bd.position = box2d.coordPixelsToWorld(x, y);
    ground = box2d.createBody(bd);

    PolygonShape ps = new PolygonShape();
    ps.setAsBox(w, height-y);

    FixtureDef f = new FixtureDef();
    f.shape = ps;
    f.density = 1;
    f.friction = 0.3;
    f.restitution = 0.1;
    ground.createFixture(f);
  }

  void display() {

    for(int i=1; i<3; i++) {
      for(int j=0; j<15; j++) {
        image(tile, 50*j, height-50*i, 50, 50);
      }
    }
    
  }
  
}

