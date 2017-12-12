float x,y,z;
float xmag, ymag = 0;
float newXmag, newYmag = 0;

float offset_z = 110.0;
float offset_y = 50.0;
float offset_x = 0.0;
  
Table points;

void setup() {
  size(200,200,P3D);
  x = width/2;
  y = height/2;
  z = -30;
  // read points
  points = loadTable("points.csv", "header");
  
}

void draw() {
  
  background(0.5);
  pushMatrix(); 
  
  translate(x,y,z);
  
  newXmag = mouseX/float(width) * TWO_PI;
  newYmag = mouseY/float(height) * TWO_PI;
  
  float diff = xmag-newXmag;
  if (abs(diff) >  0.01) { 
    xmag -= diff/4.0; 
  }
  
  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { 
    ymag -= diff/4.0; 
  }
  
  rotateX(-ymag); 
  rotateY(-xmag); 
  
  beginShape(POINTS);
    stroke(255,0,0);
    for (TableRow row : points.rows()) {
     
       float x = row.getFloat("x");
       float y = row.getFloat("y");
       float z = row.getFloat("z");
       if (y < offset_y && z < offset_z) {
         vertex(x,y,z);
       }
     
    }
    strokeWeight(1);
  endShape();
  
  popMatrix(); 
}

void keyPressed() {
  // W
  if (keyCode == UP) {
    offset_z += 1.0;
    println("Offset Z: " + offset_z);
  // A
  } else if (keyCode == LEFT) {
    offset_y -= 1.0;
    println("Offset Y: " + offset_y);
  // S
  } else if (keyCode == DOWN) {
    offset_z -= 1.0;
    println("Offset Z: " + offset_z);
  // D
  } else if (keyCode == RIGHT) {
    offset_y += 1.0;
    println("Offset Y: " + offset_y);
  }
}