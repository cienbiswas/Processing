class SquareParticle extends Particle
{
  float angle;
  float aVel;
  
  SquareParticle(PVector origin)
  {
    super(origin);
    angle = 0;
    aVel = 0.25;
    acceleration = new PVector(-0.05, 0);
  }
  
  void display(float r, float g, float b)
  {
    b -= 20;
    angle += aVel;
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    colorMode(HSB, 255);
    noStroke();
    fill(r, g, b, lifespan);
    rectMode(CENTER);
    rect(0, 0, 20, 8);
    popMatrix();
  }
}
