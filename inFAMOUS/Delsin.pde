class Delsin {
  
  int health;
  int x,y;
  float px,py,w,h;

  boolean isRunning;
  boolean isattcking;
  
  ArrayList<PImage> running;
  ArrayList<PImage> attack;
  PImage p;
  PImage sora;
  PImage standby;

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
//    f.restitution = 0.1;
    bd.createFixture(f);
    
    standby = createImage(36,51,RGB);
    standby.loadPixels();
    x=47;
    y=595;
    for(int s=0;s<standby.pixels.length;s++){
      standby.pixels[s]=sora.pixels[y*600+x];
      x++;
      if(x>82){
        x=47;
        y++; 
      }
    }
    standby.updatePixels();
    
    //running 
    running = new ArrayList<PImage>();
    int x=0;
    int y=0;
    int[][] coords = { {12,254,43,296},
                       {46,253,87,296},
                       {93,254,139,296},
                       {144,253,182,296},
                       {187,253,217,296},
                       {223,251,264,296},
                       {271,257,317,296},
                       {321,254,353,296} };
    sora = loadImage("sora.png");
    sora.loadPixels();
    
//    for(int i=0;i<8;i++){
//      p = createImage(coords[0][2]-coords[0][0]+1,coords[0][3]-coords[0][1]+1,RGB);
//      p.loadPixels();
//      x=coords[i][0];
//      y=coords[i][1];
//      for(int pix=0;pix<p.pixels.length;pix++){
//        p.pixels[pix]=sora.pixels[y*600+x];
//        x++;
//        if(x>coords[i][2]){
//          x=coords[i][0];
//          y++; 
//        }
//      }

    for(int i=0;i<8;i++){
      p = createImage(coords[i][2]-coords[i][0]+1,coords[i][3]-coords[i][1]+1,RGB);
      p.loadPixels();
      x=coords[i][0];
      y=coords[i][1];
      for(int pix=0;pix<p.pixels.length;pix++){
        p.pixels[pix]=sora.pixels[y*600+x];
        x++;
        if(x>coords[i][2]){
          x=coords[i][0];
          y++; 
        }
      }
      p.updatePixels();
      running.add(p);
    }    
  }
  
  void move(){
   Vec2 pos = bd.getPosition();
   if(up){
      if(right){
        bd.applyLinearImpulse(new Vec2(10,10),pos);
      }
      else if(left){
        bd.applyLinearImpulse(new Vec2(-10,10),pos);
      }
      else
        bd.applyLinearImpulse(new Vec2(0,10),pos);
    }
    else if(left){
      bd.applyLinearImpulse(new Vec2(-10,0),pos);
    }
    else
      bd.applyLinearImpulse(new Vec2(0,10),pos);
  }
  

  void display(){
   
    Vec2 pos = box2d.getBodyPixelCoord(bd);
    PImage display;
    x=Float.valueOf(pos.x-w/2).intValue();
    y=Float.valueOf(pos.y-h/2).intValue();
    if(!left&&!right&&up){
      display=jump; 
    }
    else if(!left&&!right){
      display=standby; 
    }
    else {
      display = running.get(counter/10);
      counter++;
      if(counter/10>7)
        counter=1;
      }
    display.loadPixels();
    for(int i=0;i<display.pixels.length;i++){
      //println(x,y);
      if(display.pixels[i]==color(73,98,132))
        display.pixels[i]=s0000.pixels[y*750+x];
      x++;
      if(x>36+Float.valueOf(pos.x-w/2).intValue()){
        x=Float.valueOf(pos.x-w/2).intValue();
        y++; 
      }
    }
    display.updatePixels();
    
    if(up){
       
    }
    else if(right){
      pushMatrix();
      scale(-1,1);
      image(display,-1*pos.x-w/2,pos.y-h/2,w,h);
      popMatrix();
      counter++; 
    }
    else if(left){
      image(display,pos.x-w/2,pos.y-h/2,w,h);
      counter++;
    }
    else
      image(display,pos.x-w/2,pos.y-h/2,w,h); 
  }
}
