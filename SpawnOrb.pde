class Orb {
  float orbX, orbY, orbSize;

  Orb(float xpos, float ypos, float size) {
    orbX = xpos;
    orbY = ypos;
    orbSize = size;
  }

  void display() {
    fill(255, 0, 0);
    ellipse(orbX, orbY, orbSize, orbSize);
  }

  void update() {
    if (dist(PlayerX, PlayerY, orbX, orbY) < Size) {
      //if ((PlayerX+(Size/2) >= orbX || PlayerX+(Size/2) <= orbX) && (PlayerY-(Size/2) >= orbY || PlayerY+(Size/2) <= orbY)) {
      background(0);
      SpawnOrb = true;
      Size += Grow;
      speed += acceleration;
    }
    if (PlayerX+10 >= 512 || PlayerX-(Size/2) <= 0 || PlayerY+(Size/2) >= 512 || PlayerY-(Size/2) <= 0) {
      if (Size > 15) {
        Size -= 2*Shrink;
      }
      speed -= acceleration;
      PlayerX = width/2;
      PlayerY = height/2;
    }
  }
}
