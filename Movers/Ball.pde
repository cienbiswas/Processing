class Ball {
  
PVector location;
PVector velocity;
PVector acceleration;

Ball()
{
  location = new PVector(width/2, height/2);
  velocity = new PVector(0, 0);
  acceleration = new PVector(0, 0);
  
}

void update()
{
  PVector mouse = new PVector(mouseX, mouseY);
  mouse.sub(location);
  mouse.setMag(1 - (1/mouse.mag()));
  acceleration = mouse;
  
  velocity.add(acceleration);
  velocity.limit(10);
  location.add(velocity);
}

void edges()
{
  if(location.x > width) location.x = 0;
  if(location.x < 0) location.x = width;
  if(location.y > height) location.y = 0;
  if(location.y < 0) location.y = height;
}

void display()
{
  stroke(0);
  strokeWeight(4);
  fill(180);
  ellipse(location.x, location.y, 50, 50);
}

}
