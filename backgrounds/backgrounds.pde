
float halfX;
float halfY;
PImage back;
static final color BG = -1;

void setup() {
  size(1600, 900, JAVA2D); 
  surface.setLocation(0, 0);
  back = loadImage("background.tif");
  smooth(8);
  //background(255, 255, 50);
  
  //back
  halfX = width/2;
  halfY = height/2;
  //for (int i = 0; i < width; i ++) {
  //  float xDist = abs(i-(halfX));
  //  float xVar = xDist/(halfX);
  //  xVar = 1 - (pow(xVar, 10));  
  //  for (int j = 0; j < height; j ++) {
  //    float yDist = abs(j - (halfY));
  //    float yVar = yDist/halfY;
  //    yVar = 1 - pow(yVar, 10);
  //    stroke(xVar * yVar * 255);
  //    point(i, j);
  //  }
  //}

  //front
  //noFill();
  //strokeWeight(.01);
  //for (int i = 0; i < 250; i ++) {

  //  float x = random(-10, 10);
  //  float y = random(-10, 10);
  //  float x2 = random(-10, 10);
  //  float y2 = random(-10, 10);
  //  float s = random(0, 55);
  //  stroke(s);
  //  rect(x, y, width + x2, height + y2, i/2);
  //}
  //filter(BLUR, 1);
  
  //saveFrame();
    
  
  
  
}

void draw() {
  //background(255);
  //image(back, 0,0);
  background(BG);
  noFill();
  strokeWeight(.01);
   for (int i = 0; i < 150; i ++) {

    float x = random(-10, 10);
    float y = random(-10, 10);
    float x2 = random(-10, 10);
    float y2 = random(-10, 10);
    rect(x, y, width + x2, height + y2, i*2);
  }
  //blendMode(BLEND);
  //filter(BLUR, 1);
  //saveFrame();
  saveTransparentCanvas(BG, "background");
}

void saveTransparentCanvas(final color bg, final String name) {
  final PImage canvas = get();
  canvas.format = ARGB;
 
  final color p[] = canvas.pixels, bgt = bg & ~#000000;
  for (int i = 0; i != p.length; ++i)  if (p[i] == bg)  p[i] = bgt;
 
  canvas.updatePixels();
  canvas.save(dataPath(name + nf(frameCount, 4) + ".png"));
}
