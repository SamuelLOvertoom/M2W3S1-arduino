//set image variable
PImage background;

//Initialise text variables from last week
String[] textfile;
String AllWords;
String[] SingleString;
Class_Word[] SingleWord; //new Class_Word[10];
//BackgroundColor bgcolor1;

color c;


//


void setup() {
  size(1200, 800);
  //Set image as background and load its pixels
  background = loadImage("sunset.jpg");
  background.loadPixels();
  loadPixels();

  //Set words
  textfile = loadStrings("text.txt");
  AllWords = join(textfile, " ");
  SingleString = splitTokens(AllWords, ".,!? ");

  SingleWord = new Class_Word[SingleString.length];

  for (int i = 0; i < SingleString.length; i++) {
    SingleWord[i] = new Class_Word(50+1.7*i, 70+20*i, SingleString[i]);
  }
}

void draw() {
  image(background, 0, 0);
  
  for (int i = 0; i < SingleWord.length; i++) {
    SingleWord[i].display();
    SingleWord[i].update();
  }
  
  for (int x = 0; x < background.width; x++) {
    for (int y = 0; y < background.height; y++) {
      int loc = x + y*background.width;

      float r, g, b;
      r = 255 - red(background.pixels[loc]);
      g = 255 - green(background.pixels[loc]);
      b = 255 - blue(background.pixels[loc]);

      c = color(r, g, b);
      for (int i = 0; i < SingleWord.length; i++) {
        SingleWord[i].updatecolor(c);
      }
      //pixels[y*width + x] = c;
      //bgcolor1 = new BackgroundColor(c);
    }
  }
  //updatePixels();
}
