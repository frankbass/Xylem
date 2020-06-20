Branch branch;
ArrayList<Branch> branches = new ArrayList();
float counter = 1;
int name = int(random(1000) * 1000);
String path = System.getProperty("user.home")+"/Desktop/branches2/"+ name + "/";

static final color BG = -1, STROKE = 0;

void setup() {
  surface.setLocation(0, 0);
  size(1600, 900, JAVA2D);
  //background(252, 252, 226);
  background(BG);
  smooth(8);


  branch = new Branch(width, 0);
  branches.add(branch);
  //for (int i = 0; i < 20; i ++) branch.newSegment();
  //branches.add(branch);
  //for (Branch b : branches) b.show(1);
  //filter(BLUR, 1);
}

void draw() {
}

void keyPressed() {
  if (keyCode == 32) {
    //background(252, 252, 226);
    background(BG);
    counter += .1;
    branch.newSegment();
    branches.add(branch);
    for (Branch b : branches) b.show(1);
    //filter(BLUR, 1);
    saveTransparentCanvas(BG, "img");
    //saveFrame(path+"####.tif");
  }
}

void saveTransparentCanvas(final color bg, final String name) {
  final PImage canvas = get();
  canvas.format = ARGB;
 
  final color p[] = canvas.pixels, bgt = bg & ~#000000;
  for (int i = 0; i != p.length; ++i)  if (p[i] == bg)  p[i] = bgt;
 
  canvas.updatePixels();
  canvas.save(dataPath(name + nf(frameCount, 4) + ".png"));
}

class Segment {
  PVector sV;
  PVector eV;
  int i;
  Segment(PVector start, PVector end, int index) {
    sV = start;
    eV = end;
    i = index;
  }
  void show(float s) {
    line(sV.x, sV.y, eV.x, eV.y);
    //ellipse(sV.x, sV.y, s*5, s*5);
  }
}

class Branch {
  ArrayList<Segment> segments = new ArrayList(); 
  ArrayList<Segment> tempSegs = new ArrayList();
  PVector start;
  Branch(float sX, float sY) {
    start = new PVector(sX, sY);
    float x = random(10, 50);
    float y = random(0, 25);
    PVector end = new PVector(start.x-x, start.y+y); 
    Segment first = new Segment(start, end, 0);
    segments.add(first);
  }
  void newSegment() {
    int index = segments.size();
    float x = random(1, 100)/counter;
    float y = random(1, 70)/counter;
    start = segments.get(index-1).eV;
    PVector end = new PVector(start.x-x, start.y+y); 
    Segment next = new Segment(start, end, index);
    segments.add(next);    
    float newBranch = random(5);
    if (newBranch > 3) {
      Branch tempBranch = new Branch(start.x, start.y);
      for (int i =0; i < 2; i++) tempBranch.newSegment();
      branches.add(tempBranch);
    }
  }
  void show(float s) {
    strokeWeight(1/s);
    stroke(0);
    fill(0);
    for (Segment i : segments) i.show(1/s);
  }
}
