int texSamplingMode = 3; // disables smoothing
int globalScale = 3;
int mouseXscaled, mouseYscaled, pmouseXscaled, pmouseYscaled;
int sW = 1024;
int sH = 768;
PFont font;
int fontSize = 48;
Settings settings;
PGraphics2D pg;

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
  
  noCursor();
  noSmooth();
  pixelDensity(1);
  rectMode(CENTER);
  ellipseMode(CENTER);
}

void draw() {
  mouseXscaled = mouseX / globalScale;
  mouseYscaled = mouseY / globalScale;
  pmouseXscaled = pmouseX / globalScale;
  pmouseYscaled = pmouseY / globalScale;
  
  pg.beginDraw();
  pg.endDraw();
  
  image(pg, 0, 0, width, height);
}
