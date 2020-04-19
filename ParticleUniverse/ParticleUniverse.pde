ArrayList<ParticleSystem> PU;

void setup()
{
  size(640, 360);
  smooth();
  PU = new ArrayList<ParticleSystem>();
  PU.add(new ParticleSystem(width/2, 20));
}

void draw()
{
  background(255); //<>//
  
  for(ParticleSystem ps : PU)
  {
    ps.addParticle();
    PVector gravity = new PVector(0, 0.05);
    ps.applyForce(gravity);
    ps.run();
  }
}

void mousePressed()
  {
    PU.add(new ParticleSystem(mouseX, mouseY));
  }
