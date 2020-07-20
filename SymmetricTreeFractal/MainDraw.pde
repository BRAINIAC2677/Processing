/*BISMILLAH
THE WHITE WOLF
NO DREAM IS TOO BIG AND NO DREAMER IS TOO SMALL*/

ArrayList<Branch> branches = new ArrayList<Branch>();
float leng = 200;  //length of the root branch
float limit = 10;

void setup()
{
  fullScreen();
  //size(1000, 900);
  background(0);
  
  //adding the 4 root branches in 4 directions
  
  PVector s = new PVector(width/2, height/2);
  PVector ea = new PVector(width/2, height/2-leng);
  PVector eb = new PVector(width/2, height/2 + leng);
  PVector ec = new PVector(width/2 - leng, height/2);
  PVector ed = new PVector(width/2 + leng, height/2);
  
  branches.add(new Branch(s, ea));
  branches.add(new Branch(s, eb));
  branches.add(new Branch(s, ec));
  branches.add(new Branch(s, ed));
}

void draw()
{
  frameRate(1);
  for(Branch k: branches)
    k.disp();
  
  //branches will be drawn untill length reaches the limit and then leaves are drawn
  
  PVector len = PVector.sub(branches.get(0).en, branches.get(0).strt);
  if(len.mag() > limit)
    update();
  else
  {
    for(Branch k: branches)
      k.leaf();
  }
}
