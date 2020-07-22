Droplet[] rain = new Droplet[800];

void setup()
{
  size(1000, 900);
  
  //creating the initial drops
  
  for(int i = 0; i< rain.length; i++)
    rain[i] = new Droplet();
}


void draw()
{
  background(0);
  
  //display and change the position of the drops making them fall
  
  for(int i = 0; i< rain.length; i++)
  {
    rain[i].disp();
    rain[i].chng();
  }
}
  
