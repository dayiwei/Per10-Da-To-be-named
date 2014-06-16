class Smoke_Shot {

  Body bd;
  PImage shot;
  int bcounter;
  int[][] coords;
  int speed;

  Smoke_Shot(Vec2 position) {
    bcounter=0;
    BodyDef def = new BodyDef();
    def.type = BodyType.DYNAMIC;
    def.bullet = true;
    def.position = position;
    bd=box2d.createBody(def);
    bd.setGravityScale(0);
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(5);
    bd.createFixture(cs,0);
    
    shot=loadImage("fireball_0.png");
    coords = new int[][] { {10,280,62,295},
                           {72,280,126,295},
                           {136,280,190,295},
                           {195,280,254,295},
                           {268,280,318,295},
                           {326,280,382,295},
                           {392,280,446,295},
                           {455,279,511,295}};
    
  }
  
  void display(Vec2 v) {
    int x1 = coords[bcounter/5][0];
    int y1 = coords[bcounter/5][1];
    int x2 = coords[bcounter/5][2];
    int y2 = coords[bcounter/5][3];    
    
    Vec2 pos = box2d.getBodyPixelCoord(bd);
    pushMatrix();
//    if(v.x<pos.x)
//      rotate(PI+asin((v.y-pos.y)/(v.x-pos.x)));
//    else
//      rotate(asin(v.y/v.x));
//    scale(.5);
    imageMode(CENTER);
    image(shot,pos.x-5,pos.y-3,(x2-x1+1)/2,(y2-y1+1)/2,x1,y1,x2,y2);
    imageMode(CORNER);
    popMatrix();
    bcounter++;
    if(bcounter/5>7)
      bcounter=0;
//    ellipseMode(CENTER);
//    ellipse(pos.x,pos.y,10,10);
    
  }
  
  void fire(Vec2 v){
    Vec2 pos = box2d.getBodyPixelCoord(bd);
    int s = speed/Float.valueOf(sqrt(pos.x*pos.x+pos.y*pos.y)).intValue();
    bd.setLinearVelocity(new Vec2(100,0));
//    bd.setLinearVelocity(new Vec2(v.x*s,v.y*s));
  }
}

