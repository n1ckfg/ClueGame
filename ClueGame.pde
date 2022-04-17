int texSamplingMode = 3; // disables smoothing
int globalScale = 1;
PVector mousePos = new PVector(0,0);
PVector pmousePos = new PVector(0,0);
int sW = 1024;
int sH = 576;
PFont font;
int fontSize = 48;
Settings settings;
PGraphics2D pg;
boolean armEnding = false;

PImage bg;
Platform platform;
Player player;
int pulsebgTarget = int(random(127));
int pulsebgCurrent = pulsebgTarget;
color bgColor = color(0,127,187);

Zone[] zone = new Zone[4];

void setup() {
  fullScreen(P2D);
  ((PGraphicsOpenGL)g).textureSampling(texSamplingMode); 
  noSmooth();

  settings = new Settings("settings.txt");
  sW /= globalScale;
  sH /= globalScale;
  
  pg = (PGraphics2D) createGraphics(sW, sH, P2D);
  ((PGraphicsOpenGL)pg).textureSampling(texSamplingMode);
  pg.noSmooth();
  
  //noCursor();
  noSmooth();
  pixelDensity(1);
  
  bg = loadImage("bg1.png");

  zone[0] = new Zone("startZone",1);
  zone[0].p = new PVector(-0.1 * sW, 0.62 * sH);

  zone[1] = new Zone("endZone",1);
  zone[1].p = new PVector(1.1 * sW, 0.58 * sH);

  zone[2] = new Zone("spikes1Zone",1);
  zone[2].p = new PVector(0.25 * sW, 0.25 * sH);

  zone[3] = new Zone("spikes2Zone",1);
  zone[3].p = new PVector(0.52 * sW, 0.85 * sH);
  
  for (int i=0; i<zone.length; i++) {
    zone[i].resize(1.0/globalScale);
    zone[i].showInGame = true;
  }
  
    
  player = new Player("car", 6, 548/2, 120, 2, 1);
  player.resize(1.0/globalScale);
  player.p = new PVector(sW/2, sH/2);
  
  platform = new Platform("platform", 1, 201 ,68, 1, 1);
  platform.resize(1.0/globalScale);
  platform.p = new PVector(sW/2, sH/2);
}

void draw() {
  mousePos.x = mouseX / globalScale;
  mousePos.y = mouseY / globalScale;
  pmousePos.x = pmouseX / globalScale;
  pmousePos.y = pmouseY / globalScale;
  
  if (!armEnding) {
    pg.beginDraw();
    
    pg.background(0);
    //pulsebg(bgColor);
    pg.imageMode(CORNER);
    pg.image(bg, 0, 0, pg.width, pg.height);
    
    for (int i=0; i<zone.length; i++) {
      zone[i].run();
    }
    
    if (zone[0].playerHit) player.alive = true;
    if (zone[1].playerHit && !armEnding) armEnding = true;
    if (zone[2].playerHit || zone[3].playerHit) player.alive = false;
    
    platform.run();
  
    player.run();
      
    pg.endDraw();
    
    image(pg, 0, 0, width, height);
  } else {
    //
  }
}

void flashScreen() {
  pg.noStroke();
  pg.fill(255,0,0,100);
  pg.rectMode(CORNER);
  pg.rect(0,0,width,height);
}

void pulsebg(color _c) {
    pg.rectMode(CORNER);
    pg.noStroke();
    pg.fill(_c,pulsebgCurrent);
    if (pulsebgCurrent>pulsebgTarget) {
      pulsebgCurrent--;
    } else if (pulsebgCurrent<pulsebgTarget) {
      pulsebgCurrent++;
    } else if (pulsebgCurrent==pulsebgTarget) {
      pulsebgTarget=int(random(127));
    }
    pg.rect(0,0,width,height);
}
