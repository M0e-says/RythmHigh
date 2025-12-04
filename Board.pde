//MANAGER
  //TEACHER, SCOREBOARD SLOT INTO THIS
class Board {
    ArrayList<Note> notes = new ArrayList<>();
    Teacher teacher;
    ScoreBoard grades;
    HashMap<String, Target> targets = new HashMap<>();
    String sequence  = "asdfjkl;";
    int buttonTimer;
  
    Board(Teacher teacher, ScoreBoard grades) {
      this.teacher = teacher;
      this.grades = grades;
      
      for (int i = 0; i < teacher.targetCount; i++) {
        //Adds Target to HashMap; divides width by targetCount+1 to set the correct X position.
        targets.put( ""+sequence.charAt(i), new Target( (width/( teacher.targetCount+1 ))*(i+1) ) );
      }
    }
    
    void display() {
      for(Note n : notes) {
        n.drawNote(); 
      }
      
      for(Target t : targets.values())
        t.drawTarget();
    } 
    
    void update() {
        if (testTeacher.num > 1)
          for (Note note : testTeacher.createNotes( targets.values().toArray(new Target[0]) ) ){
            testBoard.notes.add(note);
        } //<>//
      
      
      for(Note n : notes) {
        n.moveNote(); 
      }
      
      for(int i = 0; i < notes.size(); i++) {
          if(notes.get(i).success) {
            notes.remove(i);
          } else if (notes.get(i).y > height+50) {
            teacher.storeMissed(notes.get(i));
            notes.remove(i);
          } 
        }
      }
    
    String targetKey() {
      switch (keyCode) {
        case LEFT: return "a";
        case UP: return "s";
        case RIGHT: return  "d";
        case DOWN: return "f";
      }
      
      return ""+key;
    }
    
    void checkHits() {
      String input = targetKey();
      
      if (targets.containsKey(input)) {
        targets.get(input).animateTarget();
        targets.get(input).checkHit(notes);
      }
    }
    
    void releaseHits() {
      for(Target t : targets.values())
        t.releaseHit();
    }
}

  //PASS TEACHER SOP IT CAN TELL IT WHAT TO DO 
  //PASS SCOREBOARD AS A PUNCH CARD, TO KEEP TRACK OF TERMINOLOGY
  
  
  //4 || 8 AMOUNT OF TARGET DECIDED BY TEACHER
  
  //BOARD KNOWS ABOUT TEACHER AND SCOREBOARD
