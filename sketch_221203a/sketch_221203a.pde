int stage=1;
int startTime;int Time;
int playerJ1=0, playerI1=2;
int playerJ2=10,playerI2=4;
int winner;
int Score1=0;
int Score2=0;
int [][] bombT1 = new int[8][11];//0:沒有, 倒數計時frame
int [][] bombT2 = new int[8][11];
int [][] map = { //0: 路(可走), 1:房子(卡住), -1:紅色炸彈(卡住), -2: 會殺玩家的範圍(殺人) -3:紅色炸開後佔的範圍(可走)
                // 6: 綠色炸彈(卡住), 7:會殺玩家的範圍(殺人)  8:綠色炸開後佔的範圍(可走)
  {0,0,0,0,0,0,0,0,0,0,0},
  {0,1,0,1,0,1,0,1,0,1,0}, //1: 房子
  {0,0,0,0,0,0,0,0,0,0,0},
  {0,1,0,1,0,1,0,1,0,1,0}, //1: 房子
  {0,0,0,0,0,0,0,0,0,0,0},
  {0,1,0,1,0,1,0,1,0,1,0}, //1: 房子
  {0,0,0,0,0,0,0,0,0,0,0},  
  {0,0,0,0,0,0,0,0,0,0,0},
};
PImage img0 ,img1 ,img2 ,img3 ,img4 ,img5; 

void setup(){
  size( 550, 400);
  PFont font=createFont("標楷體",20);
  textFont(font);
  img0 = loadImage("BG.png");
  img1 = loadImage("1.png");//角色1
  img2 = loadImage("2.png");//角色2
  img3 = loadImage("h1.png");//房子
  img4 = loadImage("g1.png");//草地
  img5 = loadImage("h2.png");//房子
}
void mousePressed(){
  if(stage==1){stage=2;
  startTime=millis();}
}
void explode1(int i, int j, int c){
  map[i][j]=c;
  bombT1[i][j]=30;
  if(i+1<8 && (map[i+1][j]!=1 && map[i+1][j]!=-1) ) {map[i+1][j]=c; bombT1[i+1][j]=30;}
  if(i-1>=0 && (map[i-1][j]!=1 && map[i-1][j]!=-1) ) {map[i-1][j]=c; bombT1[i-1][j]=30;}
  if(j+1<11 && (map[i][j+1]!=1 && map[i][j+1]!=-1) ) {map[i][j+1]=c; bombT1[i][j+1]=30;}
  if(j-1>=0 && (map[i][j-1]!=1 && map[i][j-1]!=-1) ) {map[i][j-1]=c; bombT1[i][j-1]=30;}
  if(i+1<8 && map[i+1][j]==map[playerI2][playerJ2] ) {
      player2died();
  }
  if(i-1>=0 && map[i-1][j]==map[playerI2][playerJ2] ) {
      player2died();
  }
  if(j+1<11 && map[i][j+1]==map[playerI2][playerJ2] ) {
      player2died();
  }
  if(j-1>=0 && map[i][j-1]==map[playerI2][playerJ2] ) {
      player2died();
  }

}

void explode2(int i, int j, int c){
  map[i][j]=c;
  bombT2[i][j]=30;
  if(i+1<8 && (map[i+1][j]!=1 && map[i+1][j]!=-1) ) {map[i+1][j]=c; bombT2[i+1][j]=30;}
  if(i-1>=0 && (map[i-1][j]!=1 && map[i-1][j]!=-1) ) {map[i-1][j]=c; bombT2[i-1][j]=30;}
  if(j+1<11 && (map[i][j+1]!=1 && map[i][j+1]!=-1) ) {map[i][j+1]=c; bombT2[i][j+1]=30;}
  if(j-1>=0 && (map[i][j-1]!=1 && map[i][j-1]!=-1) ) {map[i][j-1]=c; bombT2[i][j-1]=30;}
  if(i+1<8 && map[i+1][j]==map[playerI1][playerJ1] ) {
      player1died();
  }
  if(i-1>=0 && map[i-1][j]==map[playerI1][playerJ1] ) {
      player1died();
  }
  if(j+1<11 && map[i][j+1]==map[playerI1][playerJ1] ) {
      player1died();
  }
  if(j-1>=0 && map[i][j-1]==map[playerI1][playerJ1] ) {
      player1died();
  }
}
void draw(){
  //background(imgBG);
  image(img1 , playerI1, playerJ1);
  image(img2 , playerI2, playerJ2);
  
  
  if(stage==1){
    background(#E3C219);//黃色
    textSize(30);
    text("請按下滑鼠鍵，開始遊戲!",100,200);
  }
  if(stage==2){
     background(#8E7B11);//土黃色（遊戲場景顏色）
     image(img0,1,1);
     if(millis()-startTime>=20000){
       stage=3;
       counting();
     }else if(millis()-startTime<=20000){
      text((millis()-startTime),210,30);
     }
  for(int i=0; i<8; i++){
    for(int j=0; j<11; j++){
      if(map[i][j]==1){
        rect(j*50, i*50, 50, 50);
        image(img5,j*50,i*50,1,1);//image(photo, x, y, w, h); xy座標,wh寬長
        //fill(#62E37);//綠色（房子
      }else if(map[i][j]==-1){
        fill(#0F8FB4);//藍色（炸彈）
        rect(j*50, i*50, 50, 50);        
      }else if(map[i][j]==-2){
        fill(255);//白色
        rect(j*50, i*50, 50, 50);   
      }else if(map[i][j]==-3){
        fill(#34E9F7);//淺藍色（炸完
        rect(j*50, i*50, 50, 50);   
      }else if(map[i][j]==6){
        fill(#F21111);//紅色(炸彈)
        rect(j*50, i*50, 50, 50);        
      }else if(map[i][j]==7){
        fill(255);//白色
        rect(j*50, i*50, 50, 50);   
      }else if(map[i][j]==8){
        fill(#FA7C8F);//粉色（炸完
        rect(j*50, i*50, 50, 50);   
      }
    }
  }
  ///以上畫圖, 以下程式的執行判斷
  for(int i=0; i<8; i++){
    for(int j=0; j<11; j++){
      if(map[i][j]==1){
      }else if(map[i][j]==-1){
        if(bombT1[i][j]>0) bombT1[i][j]--;
        else{ //時間到,就炸
          explode1(i,j, -2);//可殺人
        }
      }else if(map[i][j]==-2){
        if(bombT1[i][j]>0) bombT1[i][j]--;
        else{ //時間到,就畫地盤的色彩
          map[i][j]=-3;
        }
      }else if(map[i][j]==6){
        if(bombT2[i][j]>0) bombT2[i][j]--;
        else{ //時間到,就炸
          explode2(i,j, 7);//可殺人
        }
      }else if(map[i][j]==7){
        if(bombT2[i][j]>0) bombT2[i][j]--;
        else{ //時間到,就畫地盤的色彩
          map[i][j]=8;
        }        
      }else{
        noFill();
        rect(j*50, i*50, 50, 50);
      }
    }
  }
  fill(255);
  int playerX1=playerJ1*50+25;
  int playerY1=playerI1*50+25;
  ellipse(playerX1, playerY1, 50,50);
  fill(#151313);
  int playerX2=playerJ2*50+25;
  int playerY2=playerI2*50+25;
  ellipse(playerX2,playerY2,50,50);
  }
  if(stage==3){
    background(#F2D020);
    text("贏家是:",200,200);
    if(Score1>Score2)text("player1",250,250);
    if(Score2>Score1)text("player2",250,250);
    if(Score2==Score1)text("平手",250,250);
  }
}
void keyPressed(){
  if(stage==2){
  if(keyCode==RIGHT && notBlock1(1,0)) playerJ1++;
  if(keyCode==LEFT && notBlock1(-1,0)) playerJ1--;
  if(keyCode==DOWN && notBlock1(0,1) ) playerI1++;
  if(keyCode==UP && notBlock1(0,-1) ) playerI1--;
  if(key=='d' && notBlock2(1,0) ) playerJ2++;
  if(key=='a' && notBlock2(-1,0)) playerJ2--;
  if(key=='s' && notBlock2(0,1) ) playerI2++;
  if(key=='w' && notBlock2(0,-1) ) playerI2--;
  if(key==' ') {
    map[playerI1][playerJ1]=-1;//炸彈
    bombT1[playerI1][playerJ1]=60;//等60frame,1秒
  }
  if(key=='q') {
    map[playerI2][playerJ2]=6;//炸彈
    bombT2[playerI2][playerJ2]=60;//等60frame,1秒
  }
  }
}
void counting(){
    for(int i=0;i<8;i++){
    for(int j=0;j<11;j++){
        if(map[i][j]==-3)Score1++;
        if(map[i][j]==8)Score2++;
      }
    }
}
boolean notBlock1(int x, int y){
  if(playerI1+y<0 || playerI1+y>=8) return false;//超過界線
  if(playerJ1+x<0 || playerJ1+x>=11) return false;//超過界線
  if(map[playerI1+y][playerJ1+x]==1) return false;//不可以走
  if(playerI1+y==playerI2 && playerJ1+x==playerJ2)return false;
  else return true;//可以走
}
boolean notBlock2(int x, int y){
  if(playerI2+y<0 || playerI2+y>=8) return false;//超過界線
  if(playerJ2+x<0 || playerJ2+x>=11) return false;//超過界線
  if(map[playerI2+y][playerJ2+x]==1) return false;//不可以走
  if(playerI2+y==playerI1 && playerJ2+x==playerJ1) return false;
  else return true;//可以走
}
void player2died(){
  for(int i=0;i<8;i++){
   for(int j=0;j<11;j++){
     if(map[i][j]!=-3){
       if(map[i][j]==8)map[i][j]=0;
     }
   }
  }
}
void player1died(){
  for(int i=0;i<8;i++){
   for(int j=0;j<11;j++){
     if(map[i][j]!=8){
       if(map[i][j]==-3)map[i][j]=0;
     }
   }
  }
}
