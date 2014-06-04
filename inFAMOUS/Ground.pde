class Ground {
  
  PImage image;
  
  BodyDef bd;
  Body ground;
  
  Ground(Box2DProcessing box2d, String name){
    image = p;
    bd = new BodyDef();
    ground = box2d.createBody(bd);
    FixtureDef f = new FixtureDef();
    f.shape = loadShape(name);
    ground.createFixture(f);
     
    
    
    
  }
 
  
  
}
