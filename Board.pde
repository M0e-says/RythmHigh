//MANAGER
  //TEACHER, SCOREBOARD SLOT INTO THIS
class Board {
    ArrayList<Note> notes = new ArrayList<>();
    Teacher teacher;
    ScoreBoard grades;
    HashMap<String, Target> targets = new HashMap<>();
    String sequence  = "asdfjkl;";
    int buttonTimer;
    PImage chalkboard = loadImage("chalkboard.jpg");
  
    Board(Teacher teacher, ScoreBoard grades) {
      this.teacher = teacher;
      this.grades = grades;
      
      for (int i = 0; i < teacher.targetCount; i++) {
        //Adds Target to HashMap; divides width by targetCount+1 to set the correct X position.
        targets.put( ""+sequence.charAt(i), new Target(width*(2.4/3), height-50, i) );
      }
      
      chalkboard.resize(int(width*(2.2/3)), int(height-100));
    }
    
    void display() {
      push(); 
      translate(width*(0.6/3), 50);

      image(chalkboard, width*(0.1/3),0);
      for(Note n : notes) {
        n.drawNote(); 
      }
      
      for(Target t : targets.values())
        t.drawTarget();
      pop();
    } 
    
    void update() {
       if (testTeacher.numPatterns > 0) {
         for (Note note : testTeacher.createNotes( targets.values().toArray(new Target[0]) ) ){
           board.notes.add(note);
         } 
       } else if (notes.size() < 1 ) {
          testTeacher.saveScore();
          // SWITCH TO SCORE BOARD, 
          // THEN SWITCH TO NEW GAME!
          
        }
      
      for(Note n : notes) {
        n.moveNote(); 
      }
      
      for(int i = 0; i < notes.size(); i++) {
          if(notes.get(i).success) {
            notes.remove(i);
          } else if (notes.get(i).y > height+50) {
            teacher.storeMissed(notes.get(i));
            println("note stored");
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
