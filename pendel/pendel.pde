PVector origin;
PVector pendel;
float len;

float angle = PI/4;
float aVel = 0.0;
float aAcc = 0.0;

void setup()
{
  size(640, 360);
  len = 180;
  origin = new PVector(width/2, 0);
  pendel = new PVector(width/2, len);
}

void draw()
{
  background(255);
  line(0, 0, width, 0);
  
  pendel.x = origin.x + len * sin(angle);
  pendel.y = origin.y + len * cos(angle);
  
  line(origin.x, origin.y, pendel.x, pendel.y);
  
  stroke(0);
  ellipse(pendel.x, pendel.y, 32, 32);
  
  aAcc = -0.01 * sin(angle);
  
  angle += aVel;
  aVel += aAcc;
  
  aVel *= 0.99;
  
  if(mousePressed)
  {
    angle = PI/4;
    aVel = 0.0;
    aAcc = 0.0;
  }
}
