import processing.serial.*;
Serial myPort;

int x;
int y;
int b;
PFont f;
String portName;
String val;

//The game part
float Size = 15;    //Size of player
float Grow = 1.2;   //Grow increment per orb collected
float Shrink = 2.5; //Shrink increment each time a wall is hit

float PlayerX = 256; //(Starting) location of player
float PlayerY = 256;

float speed = 1.5;  //Starting speed
float acceleration = 0.2; //Added acceleration per orb collected

Orb orb;
boolean SpawnOrb = true;
boolean PlayGame = false;


void setup()
{
  size (512, 512);
  background(0);
  myPort = new Serial(this, Serial.list()[2], 9600);
  myPort.bufferUntil('\n');
  f = createFont("Arial", 16, true);
  textFont ( f, 16 ) ;
  ellipseMode(CENTER);
}


void draw()
{
  background(0);
  fill(255, 255, 255);
  if (PlayGame) {
    ellipse(PlayerX, PlayerY, Size, Size);
  }
  //PlayerX = float(x)/2;
  //PlayerY = float(y)/2;


  if (SpawnOrb == true) {
    //background(0);
    orb = new Orb(random(10, 502), random(10, 502), 10);
    SpawnOrb = false;
  }
  orb.display();
  orb.update();

  text("AnalogX="+(1023-x)+" AnalogY="+(1023-y), 10, 20);
  text("PlayerX="+(PlayerX)+" PlayerY="+(PlayerY), 10, 40);
}


void serialEvent( Serial myPort)
{
  val = myPort.readStringUntil('\n');
  if (val != null)
  {
    val = trim(val);
    int[] vals = int(splitTokens(val, ","));
    y = 1023-vals[0];
    x = vals[1] ;
    b = vals[2];

    if (PlayGame == false) {
      if (b == 1) {
        PlayGame =! PlayGame;
      }
    }

    //PlayerX += float(x/1023);
    //PlayerY += float(y/1023);


    if (y >= 750 && y <= 1023) {
      PlayerY += speed;
    }
    if (y <= 250 && y >= 0) {
      PlayerY -= speed;
    }
    if (x >= 750 && x<= 1023) {
      PlayerX += speed;
    }
    if (x <= 250 && x>= 0) {
      PlayerX -= speed;
    }
  }
}
