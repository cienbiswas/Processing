class Population{
  
  float mutationRate;
  DNA[] population;
  ArrayList<DNA> matingPool;
  String target;
  int generations;
  boolean finished;
  int perfectScore;
  
  //Constructor
  Population(String t, float m, int num){
    target = t;
    mutationRate = m;
    population = new DNA[num];
    for(int i = 0; i < population.length; i++){
      population[i] = new DNA(target.length());
    }
    calcFitness();
    matingPool = new ArrayList<DNA>();
    finished = false;
    generations = 0;
    
    perfectScore = 1;
  }
  
  //calculates fitness with the calcFitness method from DNA
  void calcFitness(){
    for(int i = 0; i < population.length; i++){
      population[i].fitness(target);
    }
  }
  
  //normalizes all the fitness values so that you can compare them.
  void naturalSelection(){
    //clears the Array
    matingPool.clear();
    
    //finds the String with the highest fitness
    float maxFitness = 0;
    for(int i = 0; i < population.length; i++){
      if(population[i].fitness > maxFitness){
        maxFitness = population[i].fitness;
      }
    }
    
    //normalizes the fitness values and then adds them as often to the matingPool
    //according to their fitness values
    for(int i = 0; i < population.length; i++){
      float fitness = map(population[i].fitness, 0, maxFitness, 0, 1);
      int n = int(fitness * 100);
      for(int r = 0; r < n; r++){
        matingPool.add(population[i]);
      }
    }
  }
  
  //Create a new generation
  void generate(){
    //Refill the population with children made with the mating pool
    for(int i = 0; i < population.length; i++){
          int a = int(random(matingPool.size()));
          int b = int(random(matingPool.size()));
          DNA partnerA = matingPool.get(a);
          DNA partnerB = matingPool.get(b);
          DNA child = partnerA.crossover(partnerB);
          child.mutate(mutationRate);
          population[i] = child;
    }
    generations++;
  }
  
  //Calculates the best String according to fitness
  //returns it
  String getBest() {
    float worldRecord = 0.0;
    int index = 0;
    for (int i = 0; i < population.length; i++) {
      if (population[i].fitness > worldRecord) {
        index = i;
        worldRecord = population[i].fitness;
      }
    }
    
    if (worldRecord == perfectScore ) finished = true;
    return population[index].getPhrase();
  }
  
  boolean finished() {
    return finished;
  }
  
  int getGenerations(){
    return generations;
  }
  
  //Return the average fitness score
  float getAverageFitness(){
    float sum = 0;
    for(int i = 0; i < population.length; i++){
      sum += population[i].fitness;
    }
    
    return sum / (population.length);
  }
  
  String allPhrases() {
    String everything = "";
    
    int displayLimit = min(population.length, 700);
    
    for(int i = 0; i < displayLimit; i++){
      everything += population[i].getPhrase() + ",   ";
      if(i != 0){
        if(i % 19 == 0){
          everything += "\n";
        }
      }
    }
    
    return everything;
  }
}
