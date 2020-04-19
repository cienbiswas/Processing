class Attractor
{
  PVector location;
  float mass;
  float G;
  PVector dragOffset;
  
  Attractor()
  {
    location = new PVector(width/2, height/2);
    mass = 20;
    G = 1;
    dragOffset = new PVector(0.0, 0.0);
  }
  
  PVector attract(Mover m)
  {
    //Direction of the force
    PVector force = PVector.sub(location, m.location);
    float d = force.mag();
    d = constrain(d, 5, 20);
    force.normalize();
    
    //Magnitude of the force
    float strength = (G * mass * m.mass) / (d * d);
    
    //putting dir and mag together
    force.mult(strength);
    
    return force;
  }
  
  void display()
  {
    stroke(0);
    strokeWeight(4);
    fill(255, 255, 0);
    ellipse(location.x, location.y, mass*5, mass*5);
  }
}
