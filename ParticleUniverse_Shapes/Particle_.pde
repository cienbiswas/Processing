class Particle 
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float lifespan = 255;
  
  Particle(PVector origin)
  {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-0.5, 0.5), random(-0.5, 0.5));
    location = origin.get();
  }
  
  void update()
  {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2;
  }
  
  boolean isDead()
  {
    if(lifespan <= 0)
      return true;
    else
      return false;
  }
  
  void display(float r, float g, float b)
  {
    colorMode(HSB, 255);
    noStroke();
    fill(r, g, b, lifespan);
    ellipse(location.x, location.y, 12, 12);
  }
}
