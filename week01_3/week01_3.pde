void setup(){
  size(500,500); 
}
void draw(){
  if(mousePressed){
   line(mouseX,mouseY,pmouseX,pmouseY); 
  }
}
