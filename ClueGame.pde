int texSamplingMode = 3; // disables smoothing
int globalScale = 3;
PVector mousePos = new PVector(0,0);
PVector pmousePos = new PVector(0,0);
int sW = 1024;
int sH = 768;
PFont font;
int fontSize = 48;
Settings settings;
PGraphics2D pg;

AnimSprite bg;
AnimSprite platform;
Player player;

void setup() {
  fullScreen(P2D);
  ((PGraphicsOpenGL)g).textureSampling(texSamplingMode); 
  noSmooth();

  settings = new Settings("settings.txt");
  sW = displayWidth / globalScale;
  sH = displayHeight / globalScale;
  
  pg = (PGraphics2D) createGraphics(sW, sH, P2D);
  ((PGraphicsOpenGL)pg).textureSampling(texSamplingMode);
  pg.noSmooth();
  
  //noCursor();
  noSmooth();
  pixelDensity(1);
  rectMode(CENTER);
  ellipseMode(CENTER);
  
  player = new Player("car.png", 6, 548/2, 120, 2, 1);
}

void draw() {
  mousePos.x = mouseX / globalScale;
  mousePos.y = mouseY / globalScale;
  pmousePos.x = pmouseX / globalScale;
  pmousePos.y = pmouseY / globalScale;
  
  pg.beginDraw();
  
  player.run();
  
  pg.endDraw();
  
  image(pg, 0, 0, width, height);
}
