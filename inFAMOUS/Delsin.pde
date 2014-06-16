class Delsin {
  
  int health;
  int x,y;
  float px,py,w,h;
  int[][] run;
  int[] jump;
  int[] standby;
  PImage sora;

  
  boolean isRunning;
  boolean isattcking;

  Body bd;

  Delsin(float px, float py){
    px=px;
    py=py;
    w=34;
    h=44;
    counter=1;
    health = 100;
    up=false;
    left=false;
    right=false;
    isRunning=false;
    BodyDef def = new BodyDef();
    def.type = BodyType.DYNAMIC;
    //center point
    def.position.set(box2d.coordPixelsToWorld(px,py));
    def.fixedRotation = true;
    bd = box2d.createBody(def);
    
    PolygonShape ps = new PolygonShape();
    ps.setAsBox(box2d.scalarPixelsToWorld(w/2), box2d.scalarPixelsToWorld(h/2));

    FixtureDef f = new FixtureDef();
    f.shape = ps;
    f.friction = 0.5;
    f.density=1;
//    f.restitution = 0.1;
    bd.createFixture(f);

    sora = loadImage("sora1.png");    
    
    //running 
    run = new int[][] { {12,254,43,296},
          {46,253,87,296},
          {93,254,139,296},
          {144,253,182,296},
          {187,253,217,296},
          {223,251,264,296},
          {271,257,317,296},
          {321,254,353,296} };
    
    jump = new int[] {128,736,152,798};
    
    standby = new int[] {47,595,82,645};
    
    smokeShot = new ArrayList<Smoke_Shot>();
  }
  
  void move(){
    Vec2 pos = bd.getPosition();
   if(up){
      if(right){
//        bd.applyLinearImpulse(new Vec2(20,30),pos,true);
        bd.setLinearVelocity(new Vec2(20,30));
      }
      else if(left){
//        bd.applyLinearImpulse(new Vec2(-20,30),pos,true);
        bd.setLinearVelocity(new Vec2(-20,30));
      }
      else{
//        bd.applyLinearImpulse(new Vec2(0,30),pos,true);
        bd.setLinearVelocity(new Vec2(0,30));
      }
    }
    else if(left){
//      bd.applyLinearImpulse(new Vec2(-20,0),pos,true);
        bd.setLinearVelocity(new Vec2(-20,0));
    }
    else if(right){
//      bd.applyLinearImpulse(new Vec2(20,0),pos,true);
        bd.setLinearVelocity(new Vec2(20,0));
    }
  }
  
  void shoot(float x, float y){
    Smoke_Shot bullet = new Smoke_Shot(bd.getPosition());
    smokeShot.add(bullet);
    bullet.fire(box2d.coordPixelsToWorld(new Vec2(x,y)));
    bullet.display(new Vec2(x,y));
  }

  void display(){

    Vec2 pos = box2d.getBodyPixelCoord(bd);
//    println(pos);
    x=Float.valueOf(pos.x-w/2).intValue();
    y=Float.valueOf(pos.y-h/2).intValue();
  
    if(up){
      int x1=jump[0];
      int y1=jump[1];
      int x2=jump[2];
      int y2=jump[3];
      
      if(right){
        pushMatrix();
        scale(-1,1);
        image(sora,-1*pos.x-w/2,pos.y-h/2,x2-x1+1,y2-y1+1,x1,y1,x2,y2);
        popMatrix();
      }
      else
        image(sora,pos.x-w/2,pos.y-h/2,x2-x1+1,y2-y1+1,x1,y1,x2,y2);
    }
    else if(right){
      int x1=run[counter/5][0];
      int y1=run[counter/5][1];
      int x2=run[counter/5][2];
      int y2=run[counter/5][3];
      pushMatrix();
      scale(-1,1);
      image(sora,-1*pos.x-w/2,pos.y-h/2,x2-x1+1,y2-y1+1,x1,y1,x2,y2);
      popMatrix();
      counter++;
      if(counter/5>7){
        counter=0; 
      }
    }
    else if(left){      
      int x1=run[counter/5][0];
      int y1=run[counter/5][1];
      int x2=run[counter/5][2];
      int y2=run[counter/5][3];
      image(sora,pos.x-w/2,pos.y-h/2,x2-x1+1,y2-y1+1,x1,y1,x2,y2);      
      counter++;
      if(counter/5>7){
        counter=0; 
      }
    }
    else{      
      int x1=standby[0];
      int y1=standby[1];
      int x2=standby[2];
      int y2=standby[3];
      image(sora,pos.x-w/2,pos.y-h/2,x2-x1+1,y2-y1+1,x1,y1,x2,y2);
    }
  }
}
