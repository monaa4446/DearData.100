Table table;
int[] shapes;// will remember each drink's shape number

void setup() {
  size(1000, 600);
  //reads csv and puts it in table box
  table = loadTable("drinks.csv", "header");
  
  shapes = new int[table.getRowCount()];// one slot per drink
  for (int n = 0; n < shapes.length; n++) {
    shapes[n] = int(random(4));//picks 0,1,2 or 3
  }
}
void draw() { 
  background(255);
  int i = 0; // i is a counter which starts at 0
  for (TableRow row : table.rows()) { // is a loop, for every row does everything in curly brackets
    float x = 50 + (i % 15) * 65;//
    float y = 60 +(i / 15) * 65; 
    // these 2 lines decide where circle goes
    
    String sizeWord = row.getString("Size"); // reads word in size collumn
    float s = getSize(sizeWord);// hands word to method and gets number back
    
    pushMatrix();//bookmark in where drink was
    translate(x,y); //locates drinks spot in middle of the spot
    scale(s / 50.0);
    fill(255,150,180);//picks color to fill shapes with
    noStroke();//no outlines
    
    int shapeNumber = shapes[i];
    if (shapeNumber == 0) {
      drawHeart();
    }
      
    if (shapeNumber == 1) {
      drawFlower();
    }
   if (shapeNumber == 2) {
      drawButterfly();
   }
    if (shapeNumber == 3) {
      drawBow();
    }
    
    popMatrix();//keeps shapes bookmarked
    i = i + 1;//adds 1 to the counter
  }
}
float getSize(String sizeWord) { // this is a method that returns a value, word goes in number comes out, string so includes letters
  String word = sizeWord.trim().toLowerCase();// needs a number to work on first, then removes spaces and cleans any spelling mistakes 
  
  //each if asks if word is small medium or large and return hands back matching number of pixels wide and tall 
  if (word.equals("small")){
    return 25;
  }
  
  if (word.equals("medium")){
    return 40;
  }

  
  if (word.equals("large")){
    return 60;
  }
  
  return 30;// backup incase anything unexpected
}
  
  void drawHeart (){ //2 bumps and a triangle
    ellipse(-12,-8,28,28);
    ellipse(12,-8,28,28);
    triangle(-25, -5, 25, -5, 0, 28);
  }
   void drawFlower (){
     for (int p =0; p < 6 ; p++) { // repeats everything inside the loop 6 times for 6 petals
       rotate(TAU / 6);//rotates it so each petal faces a different way
    ellipse(0,12,18,25);//one petal below the middle
  }
  fill(255,255,120);// switches  middle colour to yellow
  ellipse(0,0,15,15); //small yellow circle in middle
   }
   
    void drawButterfly (){
    ellipse(-12,-8,25,30);
    ellipse(12,-8,25,30);// 2 top wings
    ellipse(-10, 10, 18, 20);
    ellipse(10,10,18,20);// 2 bottom wings
    fill(80);//switch to dark grey
    rect(-2, -15, 4, 32);// rectangle for body
  }
    
  void drawBow () {
    triangle(0,0,-25,-15,-25,15);//left loop
    triangle(0,0,25,-15,25,15);//right loop
    ellipse(0,0,10,10);//middle circle
  }
  
  
    
