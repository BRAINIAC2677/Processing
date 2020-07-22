/*BISMILLAH
THE WHITE WOLF
NO DREAM IS TOO BIG AND NO DREAMER IS TOO SMALL*/

ArrayList<Branch> branches = new ArrayList<Branch>();  //contain the branches
Droplet[] rain = new Droplet[800];    //contain the drops

float leng = 300;  //length of the root branch
float limit = 10;  //length of the shortest branch
int leafstrt = 0;  //starting index in branches array to which leaves will grow

boolean slow = true;  //Slow framerate till the branches grow
boolean rs = false;   //if rs is true after leaves appear, there will be raining which changes by mouseclick

void setup()
{
  //size(1000, 900);
  fullScreen();
  
  //adding the root branch
  
  PVector s = new PVector(width/2, height);
  PVector e = new PVector(width/2, height-leng);
  branches.add(new Branch(s, e));
  
  //Initial droplets
  
  for(int i = 0; i< rain.length; i++)
    rain[i] = new Droplet();
}

void draw()
{
  background(0);
  
  if(slow)
    frameRate(1);
  else
    frameRate(40);
    
  //showing the branches
  
  for(Branch k: branches)
    k.disp();
  
  //branches will be drawn untill length reaches the limit and then leaves are drawn
  
  PVector len = PVector.sub(branches.get(branches.size() - 1).en, branches.get(branches.size() - 1).strt);
  
  if(len.mag() > limit)
    update();
  else
  {
    for(int i = leafstrt; i < branches.size(); i++)
    {
      branches.get(i).leaf();
      branches.get(i).leafnode.y += random(2, 10);
      slow = false;
    }
  }
  
  //Raining strts when mouse is clicked at any moment after leaves appears
  
  if(rs && !slow)
  {
    for(int r = 0; r < rain.length; r++)
    {
      rain[r].disp();
      rain[r].chng();
    }
  }
  
}

void mousePressed()
{
  if(rs)
    rs = false;
  else
    rs = true;
}
