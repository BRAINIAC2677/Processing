//This function will replace the current arraylist with their child branches

void update()
{
  ArrayList<Branch> cur = new ArrayList<Branch>();
  
  for(Branch k: branches)
  {
    cur.add(k.childA());
    cur.add(k.childB());
  }
  
  branches = cur;
}
