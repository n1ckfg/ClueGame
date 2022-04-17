import guru.ttslib.*;

TTS tts;
PFont font;
int fontSize = 48;

String victoryMessage = "Congratulations!";

void setupVictoryMessage() {
  tts = new TTS();
  font = loadFont("FrankRuhlHofshi-Bold-48.vlw");
  pg.textFont(font, fontSize);
  pg.textAlign(CENTER);
}

void speak() {
  tts.speak(victoryMessage);
}

void drawMessage() {
  fill(127,255,255);
  stroke(255, 0, 0);
  rect(0, 0, sW, sH);
  pg.text(victoryMessage, 0, 0);
}
