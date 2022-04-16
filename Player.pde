class Player extends AnimSprite {

  float ease = 4;
  boolean dead = true;
  
Player(String _name, int _fps){
   super(_name, _fps);
   init(); 
 }

Player(String _name, int _fps, int _tdx, int _tdy, int _etx, int _ety){
   super(_name, _fps, _tdx, _tdy, _etx, _ety);
   init(); 
 }
 
 Player(PImage[] _name, int _fps){
   super(_name, _fps);
   init();
 }
 
 void update(){
   super.update();


   p.x = tween(p.x, mousePos.x, ease);
   p.y = tween(p.y, mousePos.y, ease);       

   p.x = boundary(p.x,0,float(width));
   p.y = boundary(p.y,0,float(height));
 }
 
 void draw(){
   super.draw();
 }
 
 void run(){
   update();
   draw();
 }

}
