float t = 0;

void setup()
{
  size(600, 400);
}

void draw()
{
  background(0);
  fill(255);
  
  t += 0.01;
  
  float x = noise(t);
  float y = noise(t);
  x = map(x, 0, 1, 0, width);
  y = map(y, 0, 1, 0, height);
  ellipse(x, y, 40, 40);
}
