int x = 25;
int y = 25;
int xv = 25;
int yv = 25;
int half_size = 25;
int siz = 50;  // size of the shape
boolean run_ck = true; //Checks whether loop is running or not

void setup()
{
  size(400, 400);
  noCursor();
}

void draw()
{
  fill(100, 0, 0);  // color of the shape
  cursor(HAND);
  rectMode(CENTER);
  if(x%5 == 0 || x%3 == 0)  //for horizontal motion
  {
    ellipse(x, y, siz, siz);
    ellipse(width - x, height - y, siz, siz);
  }
  if(yv%5 == 0||yv%3 == 0)  //for vertical motion
  {
    ellipse(xv, yv, siz, siz);
    ellipse(width-xv, height-yv, siz, siz);
  }
  yv++;
  x++;
  if(x-half_size > width)  //starting again horizontal
  {
    x = half_size;
    y += half_size;
  }
  if(yv-half_size> height)  //starting again vertical
  {
    yv = half_size;
    xv += half_size;
  }
  if(xv - half_size > height)  //one complete cycle
  {
    noLoop();
    run_ck = false;
  }
}

void mousePressed()  //pressing mousebutton will on/off the process
{
  if(run_ck)
  {
    noLoop();
    run_ck = false;
  }
  else
  {
    loop();
    run_ck = true;
  }
}
