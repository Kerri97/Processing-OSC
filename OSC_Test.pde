// Importing the Libaries
import netP5.*;
import oscP5.*;

// Creating Variables to hold Data
OscP5 oscP5;
NetAddress myRemoteLocation;
boolean portListening = false;

// Initialising colour channels for R,G,B (incoming data)
int r = 0;
int g = 0;
int b = 0;


void setup() {

  size(600, 600, P2D);
  frameRate(30);
  background(0);

  oscP5 = new OscP5(this, 7771); // Start listening for incoming messages
  myRemoteLocation = new NetAddress("127.0.0.1", 57120);  // Speak to this
}

void draw() {

  // Where we will start 'painting'
  background(r, g, b);
}

void oscEvent(OscMessage theOscMessage) {
  r = theOscMessage.get(0).intValue();
  g = theOscMessage.get(1).intValue();
  b = theOscMessage.get(2).intValue();
  println(r, " ", g, " ", b);
}
