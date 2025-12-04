//OBJECT
class Note {
  int x, y;
  float ySpd, hitDist;
  Diff diff;
  String type;
  boolean success;
  
  Note(int x, float ySpd) {
    this.x = x;
    this.y = -100;
    this.ySpd = ySpd;
    this.diff = Diff.NONE; 
  }
  
  Note(int x, int y, float ySpd) {
    this(x, ySpd);
    this.y = y;
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
    fill(125, 40, 200,50);
    circle(x, y, 50);
    pop();
  }
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
