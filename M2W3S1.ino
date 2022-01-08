
/*Built with Arduino:
    https://www.arduino.cc

  Bikelight with 3 modes (v1.0)
    Author:
      Samuel Overtoom
    Student number:
      s2812118
    Teacher:
      Edwin Dertien
    With help of:
      Wout Haak
*/

//Assigning numbers to integer variables, each their own colour
int redPin = 10;
int greenPin = 11;
int bluePin = 12;

//Controls which mode is being displayed
int mode = 1;

//Repeats of each mode
int m1 = 2;
int m2 = 2;
int m3 = 100;

void setup() {
  //using the previously assigned integer variables as digital output ports
  pinMode(redPin, OUTPUT);
  pinMode(greenPin, OUTPUT);
  pinMode(bluePin, OUTPUT);

}

void loop() {
  //Mode 1, lights blink in turns
  if (mode == 1) {
    for (int i = 0; i < m1; i++) {
      digitalWrite(bluePin, LOW); //turn off the blue light
      digitalWrite(redPin, HIGH); //turn on the red light
      delay(500); //wait half a second
      digitalWrite(redPin, LOW); //repeated process
      digitalWrite(greenPin, HIGH);
      delay(500);
      digitalWrite(greenPin, LOW);
      digitalWrite(bluePin, HIGH);
      delay(500);
    }
    //next mode
    mode += 1;
  }
  //Second mode, 2 lights are lit up at the same time, but they still blink
  if (mode == 2) {
    for (int i = 0; i < m2; i++) {
      digitalWrite(redPin, HIGH); //repeated process of making sure the right lights are turned on
      digitalWrite(greenPin, LOW); //and off, as decribed in the first mode
      delay(1000);
      digitalWrite(greenPin, HIGH);
      digitalWrite(bluePin, LOW);
      delay(1000);
      digitalWrite(bluePin, HIGH);
      digitalWrite(redPin, LOW);
      delay(1000);
    }
    //next mode
    mode += 1;
  }
  //mode 3, same principle as the previous modes, but this time all lights are simultaneously turned on or off
  //they blink very fast
  if (mode == 3) {
    for (int i = 0; i < m3; i++) {
      digitalWrite(bluePin, HIGH);
      digitalWrite(greenPin, HIGH);
      digitalWrite(redPin, HIGH);
      delay(50);
      digitalWrite(bluePin, LOW);
      digitalWrite(redPin, LOW);
      digitalWrite(greenPin, LOW);
      delay(30);
    }
    mode = 1;
  }
}
