/**
 * Galaxy Creator
 * By Tara O'Malley
 
 
 * Noise Wave code (drawWave() function)
 * by Daniel Shiffman.  
 * 
 * Using Perlin Noise to generate a wave-like pattern. 
 */
 
PShape star;

PImage img;

float yoff = 0.0;        // 2nd dimension of perlin noise

boolean buttonActive;

void setup() {
  size(640,360,P2D);
  img = loadImage("download-1.png");
}


void draw() {
}


void drawWave() {
  
  noStroke();
  
  if (keyCode == LEFT) {
    background(#A4ABE4);
    fill(#051276);
  }
  
  else {
    background(51);
    fill(255);
  }


  // We are going to draw a polygon out of the wave points
  beginShape(); 
  
  //float xoff = 0;       // Option #1: 2D Noise
  float xoff = yoff; // Option #2: 1D Noise
  
  // Iterate over horizontal pixels
  for (float x = 0; x <= width; x += 10) {
    // Calculate a y value according to noise, map to 
    float y = map(noise(xoff, yoff), 0, 1, 200,300); // Option #1: 2D Noise
    // float y = map(noise(xoff), 0, 1, 200,300);    // Option #2: 1D Noise
    
    // Set the vertex
    vertex(x, y); 
    // Increment x dimension for noise
    xoff += 0.05;
  }
  // increment y dimension for noise
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);

}

// Drag mouse to change pattern of wave here
void mouseDragged() {
  
  drawWave();
  
}

// Draw to click function
// Depending on what button is pressed before, a click will draw either 
// a star, moon, planet, or orb

void mouseClicked() {
  
  //drawWave();
  
  if (keyCode == DOWN) {
    
    drawStar(); 
    
  }
  
  if (keyCode == UP){
    drawMoon();
 
  }
  
  if (keyCode == RIGHT){
    drawPlanet();
 
  }
  
  if (keyCode == SHIFT){
    drawPlanet2();
 
  }
  
  if (keyCode == CONTROL){
    drawOrb();
 
  }
  
  // Draws Death Star below
  
  if (key == BACKSPACE){
    image(img, mouseX, mouseY, width/8, height/5);
    
  }
    
  
  
}

// Draws a white circle moon

void drawMoon() {
 
  noStroke();
  
  fill(255);
  ellipse(mouseX, mouseY, 50, 50);
  
}

// Draws yellow star on click

void drawStar() {
 
  noStroke();
  fill(#FDFF85);
  
  triangle(mouseX, mouseY, mouseX - 7, mouseY - 10, mouseX + 7, mouseY - 10);
  triangle(mouseX, mouseY - 15, mouseX - 7, mouseY - 3, mouseX + 7, mouseY - 3);
  
}

// Draws red and yellow planet on click

void drawPlanet() {
  
  noStroke();
  fill(#E59C13);
  
  ellipse(mouseX, mouseY, 35, 30);
  
  fill(#D3471B);
  
  ellipse(mouseX + 3, mouseY - 4, 25, 20);
     
  fill(#EEC313);
  
  ellipse(mouseX + 4, mouseY - 8, 15, 10);
   
}

// Draws a blue and purple planet on click

void drawPlanet2() {
  
  noStroke();
  fill(#CDC2FC);
  
  ellipse(mouseX, mouseY, 35, 30);
  
  fill(#CE11DD);
  
  ellipse(mouseX - 3, mouseY + 3, 25, 20);
     
  fill(#DD117D);
  
  ellipse(mouseX - 4, mouseY + 5, 15, 10);
  
}

// Draws a planet-like orb on click

void drawOrb() {
  
  noFill();
  
  stroke(#0D83F8);
  
  ellipse(mouseX, mouseY, 35, 6);
  
  stroke(#7732EE);
  
  ellipse(mouseX, mouseY, 35, 20);
  
  stroke(#0D83F8);
  
  ellipse(mouseX, mouseY, 35, 30); 
  
}
