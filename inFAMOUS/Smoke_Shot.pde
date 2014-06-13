class Smoke_Shot {

  Body bd;

  Smoke_Shot() {
    BodyDef def = new BodyDef();
    def.type = BodyType.DYNAMIC;
    def.bullet = true;
    bd=box2d.createBody(def);
  }
}

