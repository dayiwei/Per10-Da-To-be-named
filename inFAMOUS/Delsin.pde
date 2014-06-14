class Delsin {
  
  int health;
  int x,y;
  float px,py,w,h;

  boolean isRunning;
  boolean isattcking;
  
  ArrayList<PImage> running;
  ArrayList<PImage> attack;
  //ArrayList<PImage> jump;
  PImage jump;
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
    f.density=1;
//    f.restitution = 0.1;
    bd.createFixture(f);
    
    int x=0;
    int y=0;
    sora = loadImage("sora.png");
    sora.loadPixels();
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
    int[][] coords = { {12,254,43,296},
                       {46,253,87,296},
                       {93,254,139,296},
                       {144,253,182,296},
                       {187,253,217,296},
                       {223,251,264,296},
                       {271,257,317,296},
                       {321,254,353,296} };
      
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

    for(int i=0;i<coords.length;i++){
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
    
    jump=createImage(25,62,RGB);
    jump.loadPixels();
    x=128;
    y=736;
    for(int pix=0;pix<jump.pixels.length;pix++){
      jump.pixels[pix]=sora.pixels[y*600+x];
      x++;
      if(x>152){
        x=128;
        y++; 
      }
    }
    jump.updatePixels();


//    //jump
//    jump=new ArrayList<PImage>();
//    int[][] coords1 = { {11,768,54,798},
//               {55,764,93,798},
//               {93,748,123,798},
//               {128,736,152,798} };
//    for(int i=0;i<coords1.length;i++){
//      p = createImage(coords[i][2]-coords[i][0]+1,coords[i][3]-coords[i][1]+1,RGB);
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
//      p.updatePixels();
//      jump.add(p);
//    }
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
  
  void shoot(){
    Smoke_Shot bullet = new Smoke_Shot();
    bullet.shoot();
  }

  void display(){

    Vec2 pos = box2d.getBodyPixelCoord(bd);
    println(pos);
    PImage display;
    x=Float.valueOf(pos.x-w/2).intValue();
    y=Float.valueOf(pos.y-h/2).intValue();
    if(up){
      display=jump; 
    }
    else if(!left&&!right&&!up){
      display=standby; 
    }
    else {
      display = running.get(counter/5);
      counter++;
      if(counter/5>7)
        counter=0;
    }
    display.loadPixels();
    for(int i=0;i<display.pixels.length;i++){
      if(display.pixels[i]==color(73,98,132))
        display.pixels[i]=s0000.pixels[y*width+x];
//      println(x,y);
      x++;
      if(x>display.width+Float.valueOf(pos.x-w/2).intValue()){
        x=Float.valueOf(pos.x-w/2).intValue();
        y++;
      }
    }
//    for(int b=0;b<display.height;b++){
//      for(int a=0;a<display.width;a++){
//        if(display.pixels[a+b*display.width]==color(73,98,132))
//          display.pixels[a+b*display.width]=s0000.pixels[x+y*width];
//        x++;
//        if(x>display.width+Float.valueOf(pos.x-w/2).intValue()){
//          x=Float.valueOf(pos.x-w/2).intValue();
//          y++;
//        }
//      }
//    }
    display.updatePixels();
//    println(x,y);
//    tint(73,98,132,250);
    if(up){
       image(display,pos.x-w/2,pos.y-h/2);
    }
    else if(right){
      pushMatrix();
      scale(-1,1);
      image(display,-1*pos.x-w/2,pos.y-h/2);
      popMatrix();
    }
    else if(left){
      image(display,pos.x-w/2,pos.y-h/2);
    }
    else
      image(display,pos.x-w/2,pos.y-h/2); 
//    noTint();
  }
}
