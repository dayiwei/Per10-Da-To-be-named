class Delsin {
  
  int health;
  int counter;
  float px,py,w,h;
  boolean right;
  boolean isrunning;
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
    right=true;
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
//    f.density = 1;
    f.friction = 0.5;
//    f.restitution = 0.1;
    bd.createFixture(f);

    
    
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
    for(int i=0;i<8;i++){
      p = createImage(coords[0][2]-coords[0][0]+1,coords[0][3]-coords[0][1]+1,RGB);
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
  
  void keyPressed() {
      if(key=='w'){
        
      }

      if(key=='a'){

      }
      if(key=='d'){

      }
      if(key=='s'){
        
      }
       
  }
  
  void display(){
    Vec2 pos = box2d.getBodyPixelCoord(bd);
    int x=Float.valueOf(pos.x-w/2).intValue();
    int y=Float.valueOf(pos.y-h/2).intValue();
    if(true){
      if(counter/6>7)
        counter=1;
      p = running.get(counter/6);
      p.loadPixels();
      for(int i=0;i<p.pixels.length;i++){
        if(p.pixels[i]==color(73,98,132))
          p.pixels[i]=s0000.pixels[y*750+x];
        x++;
        if(x>36+Float.valueOf(pos.x-w/2).intValue()){
          x=Float.valueOf(pos.x-w/2).intValue();
          y++; 
        }
      }
      p.updatePixels();
    }
    
    if(right){
      pushMatrix();
      scale(-1,1);
      image(p,-1*pos.x-w/2,pos.y-h/2);
      popMatrix();
    }
    else
      image(p,pos.x-w/2,pos.y-h/2);
    

    
    
  }  
  
}

