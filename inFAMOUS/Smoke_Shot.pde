class Smoke_Shot {

  Body bd;
  PImage shot;

  Smoke_Shot() {
    BodyDef def = new BodyDef();
    def.type = BodyType.DYNAMIC;
    def.bullet = true;
    bd=box2d.createBody(def);
    
    shot=loadImage("fireball_0.png");
  }
  
  void shoot(){
        image(shot,50,50);
  }
}

