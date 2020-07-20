/*BISMILLAH
THE WHITE WOLF
NO DREAM IS TOO BIG AND NO DREAMER IS TOO SMALL*/

ArrayList<Branch> branches = new ArrayList<Branch>();
float leng = 200;  //length of the root branch
float limit = 10;

void setup()
{
  size(1000, 900);
  background(0);
  
  //adding the root branch
  
  PVector s = new PVector(width/2, height);
  PVector e = new PVector(width/2, height-leng);
  branches.add(new Branch(s, e));
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
