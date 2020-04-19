class DNA{
  char[] genes;
  float fitness;
  
  //Constructor
  DNA(int num){
    genes = new char[num];
    for(int i = 0; i < genes.length; i++){
      genes[i] = (char) random(32, 128);
    }
  }
  
  //Converts character Array to a String
  String getPhrase(){
    return new String(genes);
  }
  
  //calculates the fitness of each String by comparing how many characters match
  //with the target String
  //returns the fitness e.g. 0.1, 0.03, 0.9
  void fitness(String target){
    int score = 0;
    
    for(int i = 0; i < genes.length; i++){
      if(genes[i] == target.charAt(i)){
        score++;
      }
    }
    
    fitness = (float)score / (float)target.length();
    fitness = pow(fitness, 10);
  }
  

//mixes the DNA of the parents and makes a new child with mixed DNA
  DNA crossover(DNA partner){
    //new Child
    DNA child = new DNA(genes.length);
    
    //decides a point where to split the DNA
    int midpoint = int(random(genes.length));
    
    for(int i = 0; i < genes.length; i++){
      
      if(i > midpoint)//DNA of 1st parent
        child.genes[i] = genes[i];
      else            //DNA of 2nd parent
        child.genes[i] = partner.genes[i];
    }
    
    return child;
  }
  
  //mutates a character at the probability of the mutationRate
  void mutate(float mutationRate){
    
    for(int i = 0; i < genes.length; i++){
      if(random(1) < mutationRate){
        genes[i] = (char) random(32, 128);
      }
    }
    
  }
}
