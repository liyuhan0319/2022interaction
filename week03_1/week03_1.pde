void setup(){
   size(500,500); 
   PFont font = createFont("標楷體",40);
   textFont(font);
   myShuffle();
}
String[]faces = {
    "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K",
    "紅心A","紅心2","紅心3","紅心4","紅心5","紅心6","紅心7","紅心8","紅心9","紅心10","紅心J","紅心Q","紅心K",
    "方塊A","方塊2","方塊3","方塊4","方塊5","方塊6","方塊7","方塊8","方塊9","方塊10","方塊J","方塊Q","方塊K",
    "梅花A","梅花2","梅花3","梅花4","梅花5","梅花6","梅花7","梅花8","梅花9","梅花10","梅花J","梅花Q","梅花K",
};
void myShuffle(){
   for(int k=0;k<10000;k++){
     int a = int(random(52));
     int b = int(random(52));
     String temp = faces[a];
     faces[a]=faces[b];
     faces[b]=temp; 
   }
   face1 = faces[0];
   face2 = faces[1];
   face3 = faces[2];
   face4 = faces[3];
}
void mousePressed(){
  myShuffle();
}
String face1,face2,face3,face4;
void draw(){
  drawPokerCard(100,100, face1);  //使用函式
  drawPokerCard(130,150, face2);  //使用函式
  drawPokerCard(160,200, face3);  //使用函式  
  drawPokerCard(190,250, face4);  //使用函式  
}
void drawPokerCard(int x,int y,String face){  //牌面
  int w=25;
  fill(255);
  rect(x-w/2,y-w/2,150+w,250+w,20);  //弧度
  fill(#F5DAA8);
  rect(x,y,150,250,20);  //弧度
  
  if(face.indexOf("黑桃") == -1 && face.indexOf("梅花") == -1) fill(#FF0000);
  else fill(0);  //字體顏色
  textSize(40);  //字體大小
  text(face,x,y+40);  
}
