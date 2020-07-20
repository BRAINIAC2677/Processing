/*BISMILLAH
THE WHITE WOLF
NO DREAM IS TOO BIG AND NO DREAMER IS TOO SMALL*/


void setup()
{
  fullScreen();
  //size(1000, 900);
  background(0);
}

void draw()
{
  translate(width/2, height);
  branch(300);
}


void branch(float len)
{
  stroke(#E52727);    //color of the tree 
  line(0, 0, 0, -len);
  if(len>10)         //limit of the branch length
  {
    pushMatrix();
    translate(0, -len);
    rotate(PI/4);     //Angle of branching
    branch(2*len/3);
    popMatrix();
    
    pushMatrix();
    translate(0, -len);
    rotate(-PI/4);
    branch(2*len/3);
    popMatrix();
    
  }
}
