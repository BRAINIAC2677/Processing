/*BISMILLAH
THE WHITE WOLF
NO DREAM IS TOO BIG AND NO DREAMER IS TOO SMALL*/


float time = 0;  
float lim = 10;  //No of circles or bending can be changed
float cirsize = 150;
ArrayList<PVector> points = new ArrayList<PVector>(); //for storing cycloid points

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
  
  translate(width/4, height/2);
  
  float x = 0;
  float y = 0;
  float px;
  float py;
  
  //Creating the circle or bending of lines by iterating fourier series
  //lim = random(1, 5);
  
  for(int i = 0; i< lim; i++)
  {
    px = x;
    py = y;
    float n = 2*i + 1;
    float r = cirsize*(4/(n*PI));
    strokeWeight(1);
    stroke(255, 100);
    ellipse(x, y, 2*r, 2*r);
    
    x += r*cos(n*time);
    y += r*sin(n*time);
    
    stroke(0, 0, 255);
    strokeWeight(3);
    line(px, py, x, y);

  }
  points.add(new PVector(x, y));     //storing the 1000 value of cycloid
  if(points.size() > 1000)    
    points.remove(0);
  
  //Pointting the cycloid and the graph
  int j = 200;
  
  for(int i = points.size() - 1; i > 0; i--)
  {
    //drawing the cycloid
    
    stroke(255, 0, 0);
    strokeWeight(3);
    point(points.get(i).x, points.get(i).y);
    
    //drawing the graph
    
    stroke(0, 255, 0);
    strokeWeight(3);
    point(j, points.get(i).y);
 
    
    if(i == points.size() - 1)
      line(x, y, j, points.get(i).y);  //drawing the connecting line between the centre of the smallest circle and the graph
      
    j++;
  }
  
  time += .02;
}
