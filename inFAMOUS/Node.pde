class Node {
  
  PImage image;
  Node next;
  
  Node(){
    image=null;
    next=null;
  }
  Node(PImage p){
    image = p; 
  }
  Node(PImage p, Node n){
    image = p;
    next = n;
  } 
  
  Node getNode(){
    return next;    
  }
  
  PImage getImage(){
    return image;  
  }
  
}
