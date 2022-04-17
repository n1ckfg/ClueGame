void mousePressed() {
  if (firstRun) {
    playSound(bgMusic, true);
    firstRun = false;
  }
  
  player.startJump();
}

void mouseReleased() {
  player.stopJump();
}
