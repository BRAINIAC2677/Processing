/*BISMILLAH
THE WHITE WOLF
NO DREAM IS TOO BIG AND NO DREAMER IS TOO SMALL*/


class KochLine
{
  /*Creates a line object with the points for next generation of koch*/
  
  PVector strt;
  PVector en;
  
  KochLine(PVector a, PVector b)
  {
    strt = a;
    en = b;
  }
  
  void display()  //display the line
  {
    stroke(#D4FC52);  // color of the lines
    line(strt.x, strt.y, en.x, en.y);
  }
  
  //Creating the five points
  
  PVector A()
  {
    return strt;
  }
  
  PVector E()
  {
    return en;
  }
  
  PVector B()
  {
    PVector res = PVector.sub(en, strt);
    res.div(3);
    res.add(strt);
    return res;
  }
  
  PVector C() 
  {
    PVector res = strt.copy();
    PVector third = PVector.sub(en, strt);
    third.div(3);
    res.add(third);
    third.rotate(-radians(60));
    res.add(third);
    return res;
  }
  
  PVector D()
  {
    PVector res = PVector.sub(en, strt);
    res.mult(2/3.0);
    res.add(strt);
    return res;
  }
  
  PVector F()
  {
    PVector res = strt.copy();
    PVector third = PVector.sub(en, strt);
    third.div(3);
    res.add(third);
    third.rotate(radians(60));
    res.add(third);
    return res;
  }
}



ArrayList<KochLine> lines = new ArrayList<KochLine>();
boolean swch = true;

void setup()
{
  size(1000, 900);
  //fullScreen();
  background(0);
}

void draw()
{
  frameRate(1);
  stroke(#D4FC52);
  noFill();
  PVector s = new PVector(100, height/2);
  PVector q = new PVector(width-100, height/2);
  lines.add(new KochLine(s, q));
  for(KochLine k: lines)
    k.display();
   nextgen();
}



void mousePressed()  //Pressing mouse will stop and start the process
{
  if(swch)
  {
    noLoop();
    swch = false;
  }
  else
  {
    loop();
    swch = true;
  }
}

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
    
    //Omitting these two lines will create fractal on one side
    
    cur.add(new KochLine(b, f));
    cur.add(new KochLine(d, f));
  }
  lines = cur;
}
