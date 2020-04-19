class DiamondParticle extends Particle
{
  DiamondParticle(PVector origin)
  {
    super(origin);
    acceleration = new PVector(0, -0.05);
    velocity = new PVector(random(-0.5, 0.5), random(-0.1, -1));
  }
  
  void display(float r, float g, float b)
  {
    b -= 60;
    pushMatrix();
    translate(location.x, location.y);
    colorMode(HSB, 255);
    noStroke();
    fill(r, g, b, lifespan);
    quad(-7.5, 0, 0, -15, 7.5, 0, 0, 15);
    popMatrix();
  }
}
