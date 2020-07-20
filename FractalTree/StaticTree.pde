/*BISMILLAH
THE WHITE WOLF
NO DREAM IS TOO BIG AND NO DREAMER IS TOO SMALL*/

float trunk = 300;

void setup()
{
  fullScreen();
  //size(1000, 900);
  background(0);
}

void draw()
{
  translate(width/2, height);
  branch(trunk);
}


void branch(float len)
{
  float thickness = map(len, 0, trunk,1,10);
  strokeWeight(thickness);  //thickness of the branches
  stroke(#E52727);    //color of the tree 
  line(0, 0, 0, -len);
  if(len>10)         //limit of the branch length
  {
    //Moving to right branch
    
    pushMatrix();
    translate(0, -len);
    rotate(PI/4);     //Angle of branching
    branch(2*len/3);
    popMatrix();
    
    //Moving to left branch
    
    pushMatrix();
    translate(0, -len);
    rotate(-PI/4);
    branch(2*len/3);
    popMatrix();
    
  }
}
