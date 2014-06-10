public class Smoke{
  
  int num = 1;
  ArrayList<PImage> fire;
  String prefix = "fireball/all/";

  Smoke(){
    fire = new ArrayList<PImage>();
    for(int i=45;i<63;i++){
      fire.add(loadImage(prefix+nf(i,4)+".png"));
    }
  
  }

  void display(){
    image(fire.get(num%10),0,50);
    if(counter==6){
      num++;
      counter=1;
    }  
      counter++;
  }
  
}
