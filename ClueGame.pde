int texSamplingMode = 3; // disables smoothing
int globalScale = 1;
PVector mousePos = new PVector(0,0);
PVector pmousePos = new PVector(0,0);
int sW = 1024;
int sH = 576;

Settings settings;
PGraphics2D pg;
boolean armEnding = false;
boolean armReset = false;

PImage bg;
Platform platform;
Player player;
int pulsebgTarget = int(random(127));
int pulsebgCurrent = pulsebgTarget;
color bgColor = color(0,127,187);
color uiColor = color(60, 120, 255, 127);

Zone[] zone = new Zone[4];
boolean firstRun = true;
float uiSize;
boolean armSpeak = false;

void setup() {
  fullScreen(P2D);
  ((PGraphicsOpenGL)g).textureSampling(texSamplingMode); 
  noSmooth();

  settings = new Settings("settings.txt");
  sW /= globalScale;
  sH /= globalScale;
  
  uiSize = 0.02 * sW;
  
  pg = (PGraphics2D) createGraphics(sW, sH, P2D);
  ((PGraphicsOpenGL)pg).textureSampling(texSamplingMode);
  pg.noSmooth();
  
  noCursor();
  noSmooth();
  pixelDensity(1);
  
  setupVictoryMessage();
  soundSetup();
    
  bg = loadImage("bg1.png");

  zone[0] = new Zone("startZone",1);
  zone[0].p = new PVector(-0.1 * sW, 0.62 * sH);

  zone[1] = new Zone("endZone",1);
  zone[1].p = new PVector(1.05 * sW, 0.78 * sH);

  zone[2] = new Zone("spikes1Zone",1);
  zone[2].p = new PVector(0.25 * sW, 0.07 * sH);

  zone[3] = new Zone("spikes2Zone",1);
  zone[3].p = new PVector(0.52 * sW, 0.87 * sH);
  
  for (int i=0; i<zone.length; i++) {
    zone[i].resize(1.0/globalScale);
    zone[i].showInGame = false;
  }
  
  player = new Player("car", 6, 548/2, 120, 2, 1);
  player.resize(1.0/globalScale);
  player.p = zone[0].p.copy();
  
  platform = new Platform("platform", 1, 201 ,68, 1, 1);
  platform.resize(1.0/globalScale);
  platform.p = new PVector(sW/2, sH/2);
}

void draw() {
  mousePos.x = mouseX / globalScale;
  mousePos.y = mouseY / globalScale;
  pmousePos.x = pmouseX / globalScale;
  pmousePos.y = pmouseY / globalScale;
  
  pg.beginDraw();
  if (!armEnding && !armReset) {
    
    pg.background(0);
    //pulsebg(bgColor);
    pg.imageMode(CORNER);
    pg.image(bg, 0, 0, pg.width, pg.height);
    pg.image(zone[1].frames[0], 0.82 * sW, 0.48 * sH);
    
    for (int i=0; i<zone.length; i++) {
      zone[i].run();
    }
    
    if (zone[0].playerHit) player.alive = true;
    if (zone[1].playerHit && !armEnding) armEnding = true;
    if (zone[2].playerHit || zone[3].playerHit) {
      playSound(fgSplat);
      player.alive = false;
    }
    
    platform.run();
  
    pg.fill(uiColor);
    if (player.isJumping) {
      pg.ellipse(mousePos.x, mousePos.y, uiSize*2, uiSize*2);
    } else {
      pg.ellipse(mousePos.x, mousePos.y, uiSize, uiSize);
    }
    if (mouseX != pmouseX) {
      pg.stroke(255, random(40, 50));
      pg.line(mousePos.x, mousePos.y, player.p.x, player.p.y);
    }
  
    player.run();
    
    if (!player.alive) flashScreen();
  } else if (armEnding && !armReset) {
    drawMessage();
    armSpeak = true;
    armEnding = false;
    armReset = true;
    player.p = zone[0].p.copy();
  } else if (!armEnding && armReset) {
    drawMessage();

    if (armSpeak) {
      speak();
      armSpeak = false;
    }
  }
  
  pg.endDraw();    
  
  image(pg, 0, 0, width, height);
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

/*
void exit() {
  soundStop();
}
*/
