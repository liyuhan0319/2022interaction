//mp3拉進來，Ctrl-k看檔案
import proccessing.sound.*; //音樂功能
//使用外掛，先把外掛裝起來(Sketch-library-Manage Libraries-搜sound)

void setup(){
    file1 = new SoundFile(this,"Intro Song_Final.mp3");
    file2 = new SoundFile(this,"In Game Music2.mp3");
    file3 = new SoundFile(this,"Monkey.mp3");
    file4 = new SoundFile(this,"Fruit Missed.mp3");
    
    file1.play();
}
void draw(){
  
}
void mousePressed(){
    file2.play();
}
void keyPressed(){
    fil3.play(); 
} 
