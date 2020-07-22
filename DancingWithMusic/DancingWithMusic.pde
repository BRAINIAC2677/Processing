/*BISMILLAH
THE WHITE WOLF
NO DREAM IS TOO BIG AND NO DREAMER IS TOO SMALL*/

import processing.sound.*;

Droplet[] rain = new Droplet[800];   //store the rain drops objects

float v;  
float trunk;
float angle;
AudioIn ad;
Amplitude amp;

void setup()
{
  fullScreen();
  //size(1000, 900);
  
  //Taking outside sound as input
  
  ad = new AudioIn(this, 0);
  amp = new Amplitude(this);
  ad.start();
  amp.input(ad);
  
  
  // creating the rain drops
  
  for(int i = 0; i< rain.length; i++)
    rain[i] = new Droplet();
}

void draw()
{
  background(0);
  println(amp.analyze());
  
  for(int i = 0; i< rain.length; i++)
  {
    rain[i].disp();
    rain[i].chng();
  }
  
  v = map(amp.analyze(), 0, 1, 50, 255);   //Mapping the amplitude to suitable values for use

  angle = map(amp.analyze(), 0, 1, .3, PI);   //diameter of the tree changes by changing branch angle analysing the sound
  trunk = map(amp.analyze(), 0, 1,200, 1000);  //height of the tree changes by analyzing sound
  
  translate(width/2, height);
  branch(trunk);
}


void branch(float len)
{
  
  
  float thickness = map(len, 0, trunk,1,10);  //shorter branches are thinner
  strokeWeight(thickness);  //thickness of the branches
  stroke((v*14)%256, (v*4)%256, (v*8)%256);    //color of the tree 
  line(0, 0, 0, -len);
  
  
  if(len>10)         //limit of the branch length
  {
    //Moving to right branch
    
    pushMatrix();
    translate(0, -len);
    rotate(angle);     //Angle of branching
    branch(2*len/3);
    popMatrix();
    
    //Moving to left branch
    
    pushMatrix();
    translate(0, -len);
    rotate(-angle);
    branch(2*len/3);
    popMatrix();
    
  }
}
