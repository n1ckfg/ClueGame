import guru.ttslib.*;

TTS tts;

String victoryMessage = "Congratulations!";

void setupTTS() {
  tts = new TTS();
}

void speak() {
  tts.speak(victoryMessage);
}
