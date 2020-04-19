Mover[] movers;
Attractor a;

void setup()
{
  size(800, 700);
  movers = new Mover[30];
  for(int i = 0; i < movers.length; i++)
  {
    movers[i] = new Mover();
  }
  a = new Attractor();
}

void draw()
{
  background(255);
  
  for(int i = 0; i < movers.length; i++)
  {
  //Attraction towards the middle/Attractor
  PVector forceAttractor = a.attract(movers[i]);
  movers[i].applyForce(forceAttractor);
  
  //Attraction towards the mouse
  if(mousePressed && (mouseButton == LEFT))
  {
    PVector mouse = new PVector(mouseX, mouseY);
    mouse.sub(movers[i].location);
    mouse.normalize();
    /* change the sign to attract/not attract each other */ mouse.mult(1);
    movers[i].applyForce(mouse);
  }
  
  //Attraction towards each other
  for(int t = 0; t < movers.length; t++)
  {
    if( i == t)
      {continue;}
    PVector forceMover = movers[i].attract(movers[t]);
    forceMover.mult(0.05);
    /* change the sign to attract/not attract each other */ forceMover.mult(1);
    movers[t].applyForce(forceMover);
  }
  
  movers[i].update();
  movers[i].bounce();
  movers[i].display();
  a.display();
  }
  
}
