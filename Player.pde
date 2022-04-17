class Player extends AnimSprite {

  float ease = 4;
  boolean alive = true;
  float gravity = 2;
  float floorGround1 = 380 / globalScale;
  float floorGround2 = 480 / globalScale;
  float floorGround3 = 345 / globalScale;
  float floorDivider1 = 350 / globalScale;
  float floorDivider2 = 750 / globalScale;
  float floorPlatform = 220 / globalScale;
  float floor = floorGround1;
  boolean isOnPlatform = false;
  float maxJumpHeight = 50;
  float jumpIncrement = 10;
  boolean isJumping = false;
  boolean jumpReady = true;
  
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
   
   jumpReady = (p.dist(new PVector(p.x, floor)) < 10);
   
   if (isOnPlatform) {
     if (mousePos.x == pmousePos.x) {
       p.x = platform.p.x;
     } else {
       p.x = tween(p.x, mousePos.x, ease);     
     }
     floor = floorPlatform;
   } else {
     p.x = tween(p.x, mousePos.x, ease);     

     if (p.x < floorDivider1) {
       floor = floorGround1;
     } else if (p.x >= floorDivider1 && p.x < floorDivider2) {
       floor = floorGround2;
     } else {
       floor = floorGround3;
     }
   }
      
   if (isJumping && p.y > floor - maxJumpHeight) {
     p.y -= jumpIncrement;
   } else {
     p.y = tween(p.y, floor, ease);
   }

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
 
 void startJump() {
  if (jumpReady) {
    jumpReady = false;
    isJumping = true;
  }
 }
 
 void stopJump() {
  isJumping = false;
 }

}
