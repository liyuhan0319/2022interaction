String line = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
class Fruit{
   float x,y,vx,vy;
   boolean flying;
   char c;
   PApplet sketch;
   Fruit(PApplet _sketch){
      sketch = _sketch;
      reset();
   }
   void reset(){
      x = sketch.random(100.0,300.0);
      y = 300;
      vx = sketch.random(-2,+2);
      vy = -13;
      flying = true;
      int i=int(random(26));
      c = line.charAt(i);
   }
   void update(){
      x += vx;
      y += vy;
      vy += 0.98/3;
   }
}
