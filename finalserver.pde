import processing.net.*;
Server s;
Client c;
 
void setup() {
  s = new Server(this, 8080); // Start a simple server on a port
  frameRate(10); //not too fast
}
void draw() {
  if (keyPressed == true) {
    s.write(key);
    println("server sent: " + key);
  }
  // Receive data from client
  c = s.available();
  if (c != null) {
    println("server received: " + c.readString());
  }
}
