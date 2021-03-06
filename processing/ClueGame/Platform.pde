class Platform extends AnimSprite {

  float ease = 50;
  boolean attack = false;
  PVector home = new PVector(-50,height/2);
  PVector vOrig = new PVector(8, 10);
  PVector v = vOrig;
  PVector aOrig = new PVector(0.1,1);
  PVector a = aOrig;
  PVector wall1, wall2;
  PVector target = wall1;
  float switchDist, platformDist;
  float moveSpeed = 0.01;
  
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
 
 void init() {
   super.init();
   
   setTarget(new PVector(0 * sW, 0.5 * sH), new PVector(1.0 * sW, 0.5 * sH));
   switchDist = 0.1 * sW;
   platformDist = 0.5 * sW;
 }
 
 void setTarget(PVector w1, PVector w2) {
   wall1 = w1;
   wall2 = w2;
   target = w1;
 }
 
 void update(){
   int t = millis();
   super.update();
   p.lerp(target, moveSpeed);
   if (p.dist(target) < switchDist) {
     if (target == wall1) {
       target = wall2;
     } else if (target == wall2) {
       target = wall1;
     }
   }
   if(!player.isOnPlatform && !player.isJumping && mousePressed && player.p.dist(p) < platformDist){
     player.isOnPlatform = true;
   } else if (player.isOnPlatform && !player.isJumping && player.p.dist(p) < platformDist) {
     player.isOnPlatform = true;
   } else {
     player.isOnPlatform = false;
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
