void setup(){
   size(500,500); 
}
int w=25;
void draw(){
  drawPokerCard(100,100,"S4");  //使用函式
  drawPokerCard(130,150,"H3");  //使用函式
  drawPokerCard(160,200,"D5");  //使用函式  
  drawPokerCard(190,250,"CJ");  //使用函式  
}
void drawPokerCard(int x,int y,String face){  //牌面
  fill(255);
  rect(x-w/2,y-w/2,150+w,250+w,20);  //弧度
  fill(#F5DAA8);
  rect(x,y,150,250,20);  //弧度
  
  fill(0);  //字體顏色
  textSize(40);  //字體大小
  text(face,x,y+40);  
}
