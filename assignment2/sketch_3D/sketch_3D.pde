PShape s;

void setup() {
  size(100, 100, P3D);
  s = loadShape("Felipe2.obj");
}

void draw() {
  background(204);
  translate(width/2, height/2);
  shape(s, 0, 0);
}