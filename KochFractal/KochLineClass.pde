/*BISMILLAH
THE WHITE WOLF
NO DREAM IS TOO BIG AND NO DREAMER IS TOO SMALL*/


class KochLine
{
  //Creates a line object with the points for next generation of koch
  
  PVector strt;
  PVector en;
  
  KochLine(PVector a, PVector b)  // constructor 
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
  

  PVector F()  //This one is for fractal on both side
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
