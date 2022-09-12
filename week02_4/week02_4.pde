void setup(){
   size(500,500); 
   PFont font = createFont("標楷體",40);
   textFont(font);
}
int w=25;
void draw(){
  drawPokerCard(100,100,"黑桃4");  //使用函式
  drawPokerCard(130,150,"紅心3");  //使用函式
  drawPokerCard(160,200,"方塊5");  //使用函式  
  drawPokerCard(190,250,"梅花J");  //使用函式  
}
void drawPokerCard(int x,int y,String face){  //牌面
  fill(255);
  rect(x-w/2,y-w/2,150+w,250+w,20);  //弧度
  fill(#F5DAA8);
  rect(x,y,150,250,20);  //弧度
  
  if(face.indexOf("黑桃") == -1 && face.indexOf("梅花") == -1) fill(#FF0000);
  else fill(0);  //字體顏色
  textSize(40);  //字體大小
  text(face,x,y+40);  
}
