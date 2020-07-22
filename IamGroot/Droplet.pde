class Droplet
{
  float x = random(0, width);
  float y = random(-height, 0);   //starts off(above) the screen
  
  //drops far away(less rand value) will be shorter, slow, thin giving 3d effects to some extent
  
  float rand = random(1, 10);    
  float len = map(rand, 1, 10, 8, 16);      //length of the rain drops
  float yspeed = map(rand, 1, 10, 10, 14);
  float thickness = map(rand, 1, 10, 1, 3);
  
  void disp()
  {
    stroke(200);   //color of the rain drops
    strokeWeight(thickness);
    line(x, y, x, y + len);
  }
  
  void chng()
  {
    y += yspeed;
    yspeed += .02;  //for feeling the gravity
    if(y > height)
    {
      yspeed = map(rand, 1, 10, 10, 14);
      x = random(0, width);
      y = random(-100, 0);
    }
  }
}
