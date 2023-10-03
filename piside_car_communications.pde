import processing.net.*;
import processing.io.*;
Server myServer;

void setup() {
  myServer = new Server(this, 5204);
  GPIO.pinMode(26, GPIO.OUTPUT);
  GPIO.pinMode(16, GPIO.OUTPUT);
  GPIO.pinMode(13, GPIO.OUTPUT);
  GPIO.pinMode(12, GPIO.OUTPUT);

  GPIO.digitalWrite(26, false);
  GPIO.digitalWrite(16, false);
  GPIO.digitalWrite(13, false);
  GPIO.digitalWrite(12, false);

  // I think 26 and 13 are forward pins, 16, 12 backwards
}

void draw() {

  String incoming = "";
  Client myClient = myServer.available();
  if (myClient != null) {
    incoming = myClient.readString();
  }
  /* 
   if (incoming != "") {
   //println(incoming.trim() + "length: " + incoming.trim().length());
   }
   */

  if (incoming.trim().length() > 1) {
    if (incoming.trim().substring(0, 2).equals("as")) {
      println("backwards left");
      GPIO.digitalWrite(26, false);
      GPIO.digitalWrite(16, true);
      GPIO.digitalWrite(13, false);
      GPIO.digitalWrite(12, false);
      delay(150);
    } else if (incoming.trim().substring(0, 2).equals("ds")) {
      println("backwards right");
      GPIO.digitalWrite(26, false);
      GPIO.digitalWrite(13, false);
      GPIO.digitalWrite(12, true);
      GPIO.digitalWrite(16, false);
      delay(150);
    }
  } else {
    if (incoming.trim().equals("a")) {
      println("forward left");
      GPIO.digitalWrite(26, true);
      GPIO.digitalWrite(13, false);
      GPIO.digitalWrite(12, false);
      GPIO.digitalWrite(16, false);
      delay(150);
    } else if (incoming.trim().equals("d")) {
      println("forward right");
      GPIO.digitalWrite(26, false);
      GPIO.digitalWrite(13, true);
      GPIO.digitalWrite(12, false);
      GPIO.digitalWrite(16, false);
      delay(150);
    } else if (incoming.trim().equals("w")) {
      println("forward");
      GPIO.digitalWrite(26, true);
      GPIO.digitalWrite(13, true);
      GPIO.digitalWrite(12, false);
      GPIO.digitalWrite(16, false);
      delay(150);
    } else if (incoming.trim().equals("s")) {
      println("backward");
      GPIO.digitalWrite(26, false);
      GPIO.digitalWrite(13, false);
      GPIO.digitalWrite(12, true);
      GPIO.digitalWrite(16, true);
      delay(150);
    } else {
      GPIO.digitalWrite(26, false);
      GPIO.digitalWrite(13, false);
      GPIO.digitalWrite(12, false);
      GPIO.digitalWrite(16, false);
    }
  }
} // Main end 
