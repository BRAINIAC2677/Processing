class Branch
{
  //start and end points
  
  PVector strt;
  PVector en;
  
  Branch(PVector a, PVector b)
  {
    strt = a.get();
    en = b.get();
  }
  
  //display the branches
  
  void disp()
  {
    //thickness is changed basing on the length of the current branch
    
    PVector len = PVector.sub(en, strt);
    float thickness = map(len.mag(), 0, leng, 1, 5);
    strokeWeight(thickness);
    
    stroke(#A70335);   //color of the branch
    line(strt.x, strt.y, en.x, en.y);
  }
  
  //display the leaves at the end
  
  void leaf()
  {
    noStroke();
    fill(#1651F0);  //color of the leaf
    ellipse(en.x, en.y, 5, 5);
  }
 
  //creating the right child branch
  
  Branch childA()
  {
    PVector nend = PVector.sub(en, strt);
    nend.rotate(PI/7);
    nend.mult(2/3.0);
    nend.add(en);
    Branch res = new Branch(en, nend);
    return res;
  }
  
  //creating the left child
  
  Branch childB()
  {
    PVector nend = PVector.sub(en, strt);
    nend.rotate(-PI/4);
    nend.mult(2/3.0);
    nend.add(en);
    Branch res = new Branch(en, nend);
    return res;
  }
}
