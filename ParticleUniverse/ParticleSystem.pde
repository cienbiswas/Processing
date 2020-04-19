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
    particles.add(new Particle(origin));
  }
  
  void applyForce(PVector force)
  {
    for(Particle p : particles)
    {
      //applyForce method form Particle
      p.applyForce(force);
    }
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
