void nextgen()
{
  ArrayList cur = new ArrayList<KochLine>();
  for(KochLine l: lines)
  {
    //accesing the five points for each line 
    
    PVector a = l.A();
    PVector b = l.B();
    PVector c = l.C();
    PVector d = l.D();
    PVector e = l.E();
    PVector f = l.F();
    
    //adding the new lines
    
    cur.add(new KochLine(a, b));
    cur.add(new KochLine(b, c));
    cur.add(new KochLine(c, d));
    cur.add(new KochLine(d, e));
    
    // This two lines are for fractal of both sides
    
    cur.add(new KochLine(b, f));
    cur.add(new KochLine(d, f));
  }
  lines = cur;
}
