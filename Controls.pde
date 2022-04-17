void mousePressed() {
  if (firstRun) {
    playSound(bgMusic, true);
    firstRun = false;
  }
  
  player.startJump();
}

void mouseMoved() {
  if (mouseX == pmouseX) player.p.lerp(new PVector(zone[1].p.x, player.p.y),0.0015);
}

void mouseReleased() {
  player.stopJump();
}

void keyPressed() {
  if (key == 'r') {
    stopSound(bgMusic);
    firstRun = true;
  }
}
