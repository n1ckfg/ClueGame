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

PImage bg;
Platform platform;
Player player;
int pulsebgTarget = int(random(127));
int pulsebgCurrent = pulsebgTarget;
color bgColor = color(0,127,187);

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
  
  pg.beginDraw();
  
  pg.clear();
  //pulsebg(bgColor);
  pg.imageMode(CORNER);
  pg.image(bg, 0, 0, pg.width, pg.height);

  platform.run();

  player.run();
    
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
