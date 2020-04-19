class Ball {
  
PVector location;
PVector velocity;
PVector acceleration;
float r;
float mass;

Ball()
{
  location = new PVector(random(width), height/2);
  velocity = new PVector(0, 0);
  acceleration = new PVector(0, 0);
  mass = random(0.5,4);
  r = mass * 20;
}


void applyForce(PVector force)
{
  PVector f = PVector.div(force, mass);
  acceleration.add(f);
}


void update()
{
  velocity.add(acceleration);
  location.add(velocity);
  //velocity.limit(10);
  
  acceleration.mult(0);
}

void edges()
{
  //if(location.x > width) location.x = 0;
  //if(location.x < 0) location.x = width;
  //if(location.y > height) location.y = 0;
  //if(location.y < 0) location.y = height;
  if(     (location.x + r/2) >= width) velocity.x *= -1;
  else if((location.x - r/2) <= 0) velocity.x *= -1;
  else if((location.y + r/2) >= height) velocity.y *= -1;
  else if((location.y - r/2) <= 0) velocity.y *= -1;
  if(((location.x + r/2) >= width) && ((location.y + r/2) >= height) || ((location.x + r/2) >= width) && ((location.y - r/2) <= 0) || ((location.x - r/2) <= 0) && ((location.y + r/2) >= height) || ((location.x - r/2) <= 0) && ((location.y - r/2) <= 0) || (location.x >= width) || (location.x <= 0) || (location.y >= height) || (location.y <= 0))
  {
    location.x = width/2;
    location.y = height/2;
    velocity.mult(0);
  }
}

void display()
{
  stroke(0);
  strokeWeight(4);
  fill(180);
  ellipse(location.x, location.y, r, r);
}

}
