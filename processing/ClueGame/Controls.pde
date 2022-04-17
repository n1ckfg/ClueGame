float playerNudgeSpeed = 0.002;

void mousePressed() {  
  player.startJump();
}

void mouseMoved() {
  if (mouseX == pmouseX) player.p.lerp(new PVector(zone[1].p.x, player.p.y), playerNudgeSpeed);
}

void mouseReleased() {
  player.stopJump();
}
