class Platform extends AnimSprite {

  float ease = 50;
  boolean attack = false;
  PVector home = new PVector(-50,height/2);
  PVector vOrig = new PVector(8, 10);
  PVector v = vOrig;
  PVector aOrig = new PVector(0.1,1);
  PVector a = aOrig;
  
Platform(String _name, int _fps){
   super(_name, _fps);
   init(); 
 }

Platform(String _name, int _fps, int _tdx, int _tdy, int _etx, int _ety){
   super(_name, _fps, _tdx, _tdy, _etx, _ety);
   init(); 
 }
 
 Platform(PImage[] _name, int _fps){
   super(_name, _fps);
   init();
 }
 
 void update(){
   super.update();
   if(hitDetect(player.p.x,player.p.y,player.w,player.h,p.x,p.y,w,h)){

   }
 }
 
 void draw(){
  super.draw();
 }
 
 void run(){
   update();
   draw();
 }

void reset(){
     p = new PVector(home.x,home.y);
     attack = false;
     v = new PVector(vOrig.x,vOrig.y);  
}

}
