class Player extends AnimSprite {

  float ease = 4;
  boolean alive = true;
  float floorGround1, floorGround2, floorGround3, floorDivider1, floorDivider2, floorPlatform, floor;
  boolean isOnPlatform = false;
  float maxJumpHeight, jumpIncrement;
  boolean isJumping = false;
  boolean jumpReady = true;
  PVector home;
  int lastJump = 0;
  int maxJumpTime = 100;
  float homeSpeed = 0.02;
  float onPlatformSpeed = 0.2;
  
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
 
  void init() {
    super.init();
     
    floorGround1 = 0.66 * sH;
    floorGround2 = 0.83 * sH;
    floorGround3 = 0.60 * sH;
    floorPlatform = 0.38 * sH;
    floorDivider1 = 0.34 * sW;
    floorDivider2 = 0.73 * sW;
    
    maxJumpHeight = 0.7 * sH;
    jumpIncrement = 0.08 * sH;

    home = zone[0].p;
    floor = floorGround1;
  }
 
 void moveX() {
   p.x += (mousePos.x - pmousePos.x) * 0.3;   
 }
 
 void update(){
   super.update();
   
   if (alive) {
   if (isOnPlatform) {
     p.x = lerp(p.x, platform.p.x, onPlatformSpeed);
     moveX();  
     
     floor = floorPlatform;
   } else {
     moveX();    

     if (p.x < floorDivider1) {
       floor = floorGround1;
     } else if (p.x >= floorDivider1 && p.x < floorDivider2) {
       floor = floorGround2;
     } else {
       floor = floorGround3;
     }
   }
  
     if (isJumping && p.y > floor - maxJumpHeight) {
        jumpReady=false;
        if (p.y > floor - maxJumpHeight) {
            p.y -= jumpIncrement;
        }
        if (p.y <= floor - maxJumpHeight || millis() > lastJump + maxJumpTime) {
            isJumping = false;
        }
    } else {
        if (p.y == floor - maxJumpHeight) {
            jumpReady = true;
        }
    }

     p.y = tween(p.y, floor, ease);
   } else {
     flashScreen();
     p.lerp(home, homeSpeed);
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
  jumpReady = false;
  isJumping = true;
  lastJump = millis();
 }
 
 void stopJump() {
   jumpReady = true;
   isJumping = false;
 }

}
