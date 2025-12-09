//OBJECT
class Note {
  float x, y;
  float ySpd, hitDist;
  Diff diff;
  String type;
  boolean success;
  PImage chalkNote = loadImage("chalkNote.png");
  
  Note(float x, float y, float ySpd, String type) {
    this.x = x;
    this.y = y;
    this.ySpd = ySpd;
    this.diff = Diff.NONE; 
    this.type = type;
    
    chalkNote.resize(57, 57);
  }
  
  void applyDiff(Diff diff) {
    this.diff = diff;
  }
  //IN THE CONSTRUCTOR / DELETE LATER
  //void applyType(Type type) {
  //  this.type = type;
  //}
  
  void moveNote() {
    y+=ySpd;
  }
  
  void drawNote() {
    push();
    imageMode(CENTER);
    fill(125, 40, 200,50);
    //circle(x, y, 50);
    image(chalkNote, x, y);
    pop();
  }
  
  String getType() {
    return type;
  }
  
  //void toString() {
  
  //}
}

enum Diff {NONE, SOONER, LATER, SIZE, OPACITY}


//NOTES
  //REFERENCE IMAGE
  //X AND Y 
  //ySPEED
  //ENUM DIFFERENCE: NONE, SOONER, LATER, SIZE, OPACITY (GHOST), ETC.
  //ENUM TYPESofRYTHM: 
//METHODS
  //ADD DIFFERENCE, pass difference for recording (learning)
  


//STRETCH GOALS

  //COLORS IN WRONG COLUMNS
  //
