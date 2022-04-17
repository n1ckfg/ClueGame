void mousePressed() {
  player.startJump();
}

void mouseReleased() {
  player.stopJump();
}

void keyPressed() {
  if (key == ' ') player.startJump();
}

void keyReleased() {
  if (key == ' ') player.stopJump();
}
