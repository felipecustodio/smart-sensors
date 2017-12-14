// http://colorhunt.co/c/97656

import peasy.*;

float x,y,z;

float offset_z = -4.0; // ground offset
  
Table points;
Table identified;

PeasyCam cam;

void setup() {
  size(800,600,P3D);
  x = width/2;
  y = height/2;
  z = -30;
  
  surface.setTitle("Where is my AliExpress package?");
  
  // read points
  identified = loadTable("../csv/Felipe2_identified_points.csv", "header");
  points = loadTable("../csv/Felipe2.csv", "header");
  
  // setup camera
  cam = new PeasyCam(this, 60, 650, 2*PI, 800);
  cam.rotateX(1);
  cam.rotateZ(-15);
  cam.rotateY(-.8);

  //smooth();
  println("Total points = " + points.getRowCount());
}

void draw() {
  
  background(#B0DEDB);
  pushMatrix();  
  
  // HUD
  cam.beginHUD();
    textSize(16);
    text("FPS: " + str(frameRate), 10, 30); 
    fill(#583131);
  cam.endHUD();
  
  translate(x,y+50,z+500); 

  // Point cloud
  beginShape(POINTS);
    strokeWeight(1);
    for (TableRow row : points.rows()) {
       float x = row.getFloat("x");
       float y = row.getFloat("y");
       float z = row.getFloat("z");
       stroke(#583131);
       vertex(x,y,z);
    }
  endShape();
  
  // Identified
  beginShape(POINTS);
    strokeWeight(1);
    for (TableRow row : identified.rows()) {
       float x = row.getFloat("x");
       float y = row.getFloat("y");
       float z = row.getFloat("z");
       stroke(#FC6E5E);
       vertex(x,y,z);
    }
  endShape();

  popMatrix(); 
}