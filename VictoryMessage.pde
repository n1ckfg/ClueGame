import guru.ttslib.*;

TTS tts;
PFont font;
int fontSize = 96;

String victoryMessage = "Congratulations!";

void setupVictoryMessage() {
  fontSize = int(float(fontSize) * (1.0 / globalScale));
  tts = new TTS();
  font = loadFont("fonts/FrankRuhlHofshi-Regular-96.vlw");
}

void speak() {
  stopSound(bgMusic);
  tts.speak(victoryMessage);
}

void drawMessage() {
  pg.background(0);
  pg.fill(127,255,255);
  pg.textFont(font, fontSize/2);
  pg.textAlign(CENTER);
  pg.text(victoryMessage, sW/2, sH/2);
}
