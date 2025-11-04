//OBJECT
class Note {
  int x, y;
  float ySpd;
  Diff diff;
  Type type;
  
  Note(int x, float ySpd) {
    this.x = x;
    this.y = -100;
    this.ySpd = ySpd;
    this.diff = Diff.NONE;
    this.type = Type.NONE; 
  }
  
  Note(int x, int y, float ySpd) {
    this(x, ySpd);
    this.y = y;
  }
  
  void applyDiff(Diff diff) {
    this.diff = diff;
  }
  void applyType(Type type) {
    this.type = type;
  }
  
  void moveNote() {
    y+=ySpd;
  }
  
  void drawNote() {
    push();
    fill(125, 40, 200);
    circle(x, y, 50);
    pop();
  }
}

enum Diff {NONE, SOONER, LATER, SIZE, OPACITY}
enum Type {NONE, TRIP, DTD, ROW, DIAG, COLUMN, PAIR}

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
