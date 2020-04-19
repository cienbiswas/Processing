class Mover
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float r;
  float g;
  float b;
  
  Mover()
  {
    location = new PVector(random(50, width), random(50, height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = random(1, 3.5);
    r = random(255);
    g = random(255);
    b = random(255);
  }
  
  void applyForce(PVector f)
  {
    PVector force = PVector.div(f, mass);
    acceleration.add(force);
  }
  
  PVector attract(Mover m1)
  {
    //Direction of the force
    PVector force = PVector.sub(location, m1.location);
    float d = force.mag();
    d = constrain(d, 5, 20);
    force.normalize();
    
    //Magnitude of the force
    float strength = (mass * m1.mass) / (d * d);
    
    //putting dir and mag together
    force.mult(strength);
    
    return force;
  }
  
  void update()
  {
    
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(4.5);
    
    acceleration.mult(0);
  }
  
  void display()
  {
    stroke(0);
    strokeWeight(1);
    fill(r, g, b);
    ellipse(location.x, location.y, mass*15, mass*15);
  }
  
  void bounce()
  {
    if((location.x > width) || (location.x < 0))
    {   velocity.x *= -0.5;   }
    if((location.y > height) || (location.y < 0))
    {   velocity.y *= -0.5;   }
  }
}
