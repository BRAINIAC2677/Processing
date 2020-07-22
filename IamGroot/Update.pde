
//This function will add the child branches to the array

void update()
{

  leafstrt = branches.size() - 1;      //update the leafstrt value
  
  for(int i = branches.size() - 1; i >= 0; i--)
  {
    Branch k = branches.get(i);
    if(!k.parenting)
    {
      branches.add(k.childA());
      branches.add(k.childB());
      k.parenting = true;
    }
  }
}
