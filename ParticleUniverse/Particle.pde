class Particle 
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float lifespan = 255;
  
  Particle(PVector origin)
  {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1.5, 1.5), random(-1, 1));
    location = origin.get();
  }
  
  void applyForce(PVector force)
  {
    acceleration.add(force);
  }
  
  void update()
  {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
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
    pushMatrix();
    colorMode(HSB, 255);
    stroke(0, lifespan);
    strokeWeight(2);
    //noStroke();
    fill(r, g, b, lifespan);
    ellipse(location.x, location.y, 12, 12);
    popMatrix();
  }
}
