PFont f;
String target;
int popMax;
float mutationRate;
Population population;

void setup() {
  size(840, 560);
  f = createFont("Verdana", 32, true);
  target = "Hi I'm Cien and this is my first GA!";
  popMax = 200;
  mutationRate = 0.02;
  
  population = new Population(target, mutationRate, popMax);
}

void draw() {
  //Generate mating pool
  population.naturalSelection();
  //Create next generation
  population.generate();
  //Calculate fitness
  population.calcFitness();
  
  displayInfo();
  
  if (population.finished()) {
    noLoop();
  }
}

void displayInfo(){
    
    String answer = population.getBest();
    
    if(population.finished()){
      background(50, 255, 50);
    }
    else{
      background(255);
    }
    
    textFont(f);
    textAlign(LEFT);
    fill(0);
    
    
    textSize(26);
    text("Best phrase:",20,30);
    textSize(40);
    text(answer, 20, 100);
  
    textSize(20);
    text("total generations:     " + population.getGenerations(), 20, 160);
    text("average fitness:       " + nf(population.getAverageFitness(), 0, 2), 20, 185);
    text("total population:      " + popMax, 20, 205);
    text("mutation rate:         " + int(mutationRate * 100) + "%", 20, 230);
    text("Time:                     " + millis()/1000.0 + "s", 20, 255);
   
    textSize(12);
    text("All phrases:\n" + population.allPhrases(), 20, 295);
  }
