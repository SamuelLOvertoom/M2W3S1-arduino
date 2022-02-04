//Extract words from textfile variable
String[] textfile;
String AllWords;
String[] SingleString;
Class_Word[] SingleWord; //new Class_Word[10];


//

void setup() {
  size(1200, 800);
  
  textfile = loadStrings("text.txt");
  AllWords = join(textfile, " ");
  SingleString = splitTokens(AllWords, ".,!? ");

  SingleWord = new Class_Word[SingleString.length];

  for (int i = 0; i < SingleString.length; i++) {
    SingleWord[i] = new Class_Word(50+1.7*i, 70+20*i, SingleString[i]);
  }
}

void draw() {
  background(0);
  for (int i = 0; i < SingleWord.length; i++) {
    SingleWord[i].display();
    SingleWord[i].update();
  }
}
