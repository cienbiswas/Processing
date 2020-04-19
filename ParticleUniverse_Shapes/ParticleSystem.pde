class ParticleSystem
{
  ArrayList<Particle> particles;
  PVector origin;
  float h;
  float s;
  float b;

  ParticleSystem(float x, float y)
  {
    particles = new ArrayList<Particle>();
    origin = new PVector(x, y);
    h = random(255);
    s = 255;
    b = 255;
  }
  
  void addParticle()
  {
    float r = random(1);
    if(r < 0.25)
    particles.add(new SquareParticle(origin));
    else if(r < 0.5)
      particles.add(new Particle(origin));
    else if(r < 0.75)
      particles.add(new TriangleParticle(origin));
    else
      particles.add(new DiamondParticle(origin));
  }
  
  
  void run()
  {
    for(int i = particles.size()-1; i >= 0; i--)
    {
      Particle p = particles.get(i);
      p.update();
      p.display(h, s, b);
      
      if(p.isDead())
        particles.remove(i);
    }
  }
  
}
