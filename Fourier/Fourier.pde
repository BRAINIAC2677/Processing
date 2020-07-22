float time = 0;
float r;
ArrayList<PVector> points = new ArrayList<PVector>();

void setup()
{
  fullScreen();
  //size(800, 600);
}


void draw()
{
  background(0);
  noFill();
  stroke(255);
  
  translate(width/2, height/2);
  
  float x = 0;
  float y = 0;
  float px;
  float py;
  
  for(int i = 0; i< 10; i++)
  {
    px = x;
    py = y;
    float n = 2*i + 1;
    r = 200*(4/(n*PI));
    ellipse(x, y, 2*r, 2*r);
    
    x += r*sin(n*time);
    y += r*cos(n*time);
    
    line(px, py, x, y);

  }
  points.add(new PVector(x, y));
  stroke(255, 0, 0);
  for(int i = 0; i < points.size(); i++)
    point(points.get(i).x, points.get(i).y);
  time += .1;
}
