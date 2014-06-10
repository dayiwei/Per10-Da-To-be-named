class Ground {
  
  float x,y,w;
  
  BodyDef bd;
  Body ground;
  
  Ground(float x, float y,float w){
    this.x=x;
    this.y=y;
    this.w=w;
    bd = new BodyDef();
    bd.position = box2d.coordPixelsToWorld(x,y);
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
 
  
  
}
