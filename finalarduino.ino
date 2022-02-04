/*
  Switch test program
*/
int switchPin = 3;              // Switch connected to digital pin 2
int redPin = 12;
int bluePin = 13;
int val;
int buttonState;
int buttonPresses = 0;

void setup()                    // run once, when the sketch starts
{
  Serial.begin(9600);           // set up Serial library at 9600 bps
  pinMode(redPin, OUTPUT);
  pinMode(bluePin, OUTPUT);
  pinMode(switchPin, INPUT);    // sets the digital pin as input to read switch
  buttonState = digitalRead(switchPin);
}
void loop()                     // run over and over again
{
  val = digitalRead(switchPin);
  if (val != buttonState) {
    if (val == LOW) {
      buttonPresses++;
      Serial.println(buttonPresses);
      digitalWrite(bluePin, HIGH);
      digitalWrite(redPin, HIGH);
    }
  }
  buttonState = val;
}
