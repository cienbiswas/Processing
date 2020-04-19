ArrayList<ParticleSystem> PU; //<>//

void setup()
{
  size(640, 360);
  smooth();
  PU = new ArrayList<ParticleSystem>();
  PU.add(new ParticleSystem(width/2, height/2));
}

void draw()
{
  background(30);

  for (ParticleSystem ps : PU)
  {
    ps.addParticle();
    ps.run();
  }
}

void mousePressed()
{
  PU.add(new ParticleSystem(mouseX, mouseY));
}
