/*BISMILLAH
THE WHITE WOLF
NO DREAM IS TOO BIG AND NO DREAMER IS TOO SMALL*/

float trunk;
float angle;

void setup()
{
  fullScreen();
  //size(1000, 900);
}

void draw()
{
  background(0);
  
  angle = map(mouseX, 0, width, 0, PI);   //diameter of the tree changes by changing branch angle by moving the mouse left and right
  trunk = map(mouseY, 0, height,500, 20);  //height of the tree changes by moving mouse up and down
  
  translate(width/2, height);
  branch(trunk);
}


void branch(float len)
{
  
  
  float thickness = map(len, 0, trunk,1,10);  //shorter branches are thinner
  strokeWeight(thickness);  //thickness of the branches
  stroke(#E52727);    //color of the tree 
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
