import processing.net.*;
Client myClient;
boolean [] keys = new boolean[128];
void setup () {
  size(800, 600);
  myClient = new Client(this, "10.0.0.116", 5204);
}

// I wanna try catch outofboundsexception the key inputs because I press caps a lot  
void keyPressed() {
  keys[key] = true;
}

void keyReleased() {
  keys[key] = false;
}



void draw() {
  if (focused == false) {
    println("Not focused not focused not focused");
  } 
  if (keys['a'] == true) {
    fill(0, 255, 0);
    rect(100, 225, 125, 125, 25);
    //myClient.write('a');
  } else if (keys['a'] == false) {
    fill(128, 128, 128);
    rect(100, 225, 125, 125, 25);
  }  

  if (keys['w'] == true) {
    fill(0, 255, 0);
    rect(300, 100, 125, 125, 25);
    //myClient.write('w');
  } else if (keys['w'] == false) {
    fill(128, 128, 128);
    rect(300, 100, 125, 125, 25);
  }

  if (keys['d'] == true) {
    fill(0, 255, 0);
    rect(500, 225, 125, 125, 25);
    //myClient.write('d');
  } else if (keys['d'] == false) {
    fill(128, 128, 128);
    rect(500, 225, 125, 125, 25);
  }

  if (keys['s'] == true) {
    fill(0, 255, 0);
    rect(300, 350, 125, 125, 25);
    //myClient.write('s');
  } else if (keys['s'] == false) {
    fill(128, 128, 128);
    rect(300, 350, 125, 125, 25);
  }
  textSize(27);
  fill(255, 0, 0);
  text("TURN LEFT", 90, 215);
  text("TURN RIGHT", 490, 215);
  text("DRIVE", 320, 90);
  text("BACK", 320, 335);
  fill(255, 255, 255);
  textSize(120);
  text("A", 120, 330);
  text("W", 310, 205);
  text("D", 517, 330);
  text("S", 330, 455);
  
  if (keys['a'] == true && keys['s'] == true) {
    myClient.write("as");
    //println("backwards left");
  } else if (keys['d'] == true && keys['s'] == true) {
    myClient.write("ds");
    //println("backwards right");
  } else if (keys['a'] == true) {
    myClient.write("a");
    //println("left");
  } else if (keys['d'] == true) {
    myClient.write("d");
    //println("right");
  } else if (keys['w'] == true) {
    myClient.write("w");
    //println("forwards");
  } else if (keys['s'] == true) {
    myClient.write("s");
    //println("backwards");
  }
  
} // draw loop end 
