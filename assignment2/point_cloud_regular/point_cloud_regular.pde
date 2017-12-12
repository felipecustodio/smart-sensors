float x,y,z;
float xmag, ymag = 0;
float newXmag, newYmag = 0;

int zoom = 0;

float offset_z = -4.0; // chão
  
Table points;
  
PrintWriter output;

void setup() {
  size(200,200,P3D);
  x = width/2;
  y = height/2;
  z = -30;
  // read points
  points = loadTable("points3.csv", "header");
  
}

void draw() {
  
  background(0.5);
  pushMatrix(); 
  
  lights();
  
  translate(x,y,z);
  scale(zoom);
  
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
       if (z > offset_z) {
         vertex(x,y,z);
       } 
    }
    strokeWeight(1);
  endShape();

  
  popMatrix(); 
}

void mouseWheel(MouseEvent event) {;
    float e = event.getAmount();
    if (e > 0) {
      zoom += 1;
    } else {
      zoom -= 1;
    }
  }