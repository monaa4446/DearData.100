Table table;

void setup() {
  size(1000, 600);
  //reads csv and puts it in table box
  table = loadTable("drinks.csv", "header");
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
    ellipse(x, y, s, s); //draws circle at that spot, s pixels wide, s pixels tall
    
    i = i + 1;//adds 1 to the counter
  }
}
float getSize(String sizeWord) { // this is a method, wprd goes in nimber comes out
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
  
  
  
  
    
