int[][]board={
  {4, 5, 3, 2, 1, 2, 3, 5, 4},
  {0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 6, 0, 0, 0, 0, 0, 6, 0},
  {7, 0, 7, 0, 7, 0, 7, 0, 7},
  {0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0},
  {-7, 0, -7, 0, -7, 0, -7, 0, -7},
  {0, -6, 0, 0, 0, 0, 0, -6, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0},
  {-4, -5, -3, -2, -1, -2, -3, -5, -4},
};
String[] name={"將", "士", "象", "車", "馬", "包", "卒"};
String[] name2={"帥", "仕", "相", "俥", "傌", "炮", "兵"};
void setup() {
  size(500, 550);
  PFont font = createFont("標楷體", 30);
  textFont(font);
  textAlign(CENTER, CENTER);
}
void draw() {
  background(#F0B82C);
  for (int x=50; x<=450; x+=50) {
    line(x, 50, x, 250);
    line(x, 300, x, 500);
  }
  for (int y=50; y<=500; y+=50) {
    line(50, y, 450, y);
  }
  for (int i=0; i<10; i++) {
    for (int j=0; j<9; j++) {
      int id=board[i][j];
      if (id==0)continue;
      if (id>0) {
        fill(255);
        ellipse(50+j*50, 50+i*50, 40, 40);
        fill(0);
        text(name[id-1], 50+j*50, 50+i*50-3);
      } else if (id<0) {
        fill(255);
        ellipse(50+j*50, 50+i*50, 40, 40);
        fill(255, 0, 0);
        text(name2[-id-1], 50+j*50, 50+i*50-3);
      }
    }
  }
  if (handChess!=0) ellipse(mouseX,mouseY,40,40);
}
int handChess=0;
void mousePressed() {
  for (int i=0; i<10; i++) {
    for (int j=0; j<9; j++) {
      if (dist(mouseX, mouseY, 50+j*50, 50+i*50)<20) {
        handChess=board[i][j];
        board[i][j]=0;
      }
    }
  }
}
void mouseReleased(){
    int i=(mouseY+25-50)/50;
    int j=(mouseX+25-50)/50;
    board[i][j]=handChess;
    handChess=0;
  }
