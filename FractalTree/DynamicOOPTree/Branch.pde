


class Branch
{
  //starting and ending points
  
  PVector strt;
  PVector en;
  
  Branch(PVector a, PVector b)
  {
    strt = a.get();
    en = b.get();
  }
  
  //display the recent branch
  
  void disp()
  {
    //Thickness is changed basing on length of the branch
    
    PVector len = PVector.sub(en, strt);
    float thickness = map(len.mag(), 0, leng, 1, 10);
    strokeWeight(thickness);
    
    stroke(#0C57F5);      //color of the branches
    line(strt.x, strt.y, en.x, en.y);
  }
  
  //display leaf from the end of the recent branch
  
  void leaf()
  {
    noStroke();
    fill(255, 0, 0);  //color of the branch
    ellipse(en.x, en.y, 5, 5); //shape of the leaf
  }
  
  //create a new branch to the right
  
  Branch childA()
  {
    PVector nend = PVector.sub(en, strt);
    nend.rotate(PI/4);
    nend.mult(2/3.0);
    nend.add(en);
    Branch res = new Branch(en, nend);
    return res;
  }
  
  //create a new branch to the left
  
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
