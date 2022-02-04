import processing.net.*;
Client c;
void setup() {
  c = new Client(this, "94.210.210.219", 8080); // Replace with your server's IP and port
  frameRate(10); // not too fast
}
 
void draw() {
  if (keyPressed == true) { // send data
     c.write(key);
     println("client sent: " +key);
  }
  else if (c.available() > 0) { // receive data
    println("client received: " +c.readString());
  }
}
