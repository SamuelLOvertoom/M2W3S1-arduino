class Class_Word {
  String word;
  //location
  float wordx;
  float wordy;
  //position increment
  //float WordAccelerationX;
  float xinc = 2.5;
  float yinc = 1.5;
  //rotation variable
  float rot = 0;
  float rotinc = 0.04;
  //word color
  color wordcolor = color(255);

  //float sizetext = 24;

  Class_Word(float xpos, float ypos, String SingleWord) {
    wordx = xpos;
    wordy = ypos;
    word = SingleWord;
  }

  void display() {
    pushMatrix();
    fill(wordcolor);
    translate(wordx, wordy);
    textSize(24);
    rotate(rot);
    text(word, 0, 0);
    popMatrix();
  }

  void update() {
    wordx += xinc;
    wordy += yinc;

    rot += rotinc;
    //sizetext = random(24, 32);

    if (wordx >= 1150 || wordx <= 50) {
      xinc = -xinc;
      rotinc = -rotinc;
      wordcolor = color(int(random(25, 255)), int(random(25, 255)), int(random(25, 255)));
    }
    if (wordy >= 750 || wordy <= 50) {
      yinc = -yinc;
      wordcolor = color(int(random(25, 255)), int(random(25, 255)), int(random(25, 255)));
    }
  }
}
