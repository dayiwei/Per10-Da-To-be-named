class Smoke{
  
  int counter=1;

  void display(float x, float y){
    image(fire.get(counter/6),x,y);
    counter++;
    if(counter>59){
      counter=0;
    }
  }
}
