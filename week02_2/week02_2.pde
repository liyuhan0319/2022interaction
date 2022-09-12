void setup(){
   size(500,500); 
}
int w=25;
void draw(){
  drawCard(100,100);  //使用函式
  drawCard(130,130);  //使用函式
  drawCard(160,160);  //使用函式  
}
void drawCard(int x,int y){
  fill(255);
  rect(x-w/2,y-w/2,150+w,250+w,20);  //弧度
  fill(#F5DAA8);
  rect(x,y,150,250,20);  //弧度
}
