class TriangleParticle extends Particle 
{
  float angle;
  float aVel;
  float aAcc;
  
  TriangleParticle(PVector origin)
  {
    super(origin);
    angle = 0;
    aVel = 0;
    aAcc = 0.001;
    acceleration = new PVector(0.05, 0);
  }
  
  void update()
  {
    super.update();
    angle += aVel;
    aVel += aAcc + angle/300;
    lifespan-= 0.1;
  }
  
  void display(float r, float g, float b)
  {
    b -= 40;
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    colorMode(HSB, 255);
    noStroke();
    fill(r, g, b, lifespan);
    triangle(0, 10, 8, -8, -8, -8);
    popMatrix();
  }
}
