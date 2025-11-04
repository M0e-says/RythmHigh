//MANAGER
  //TEACHER, SCOREBOARD SLOT INTO THIS
class Board {
    ArrayList<Note> notes = new ArrayList<>();
    Teacher teacher;
    ScoreBoard grades;
    Target[] targets;
  
    Board(Teacher teacher, ScoreBoard grades) {
      this.teacher = teacher;
      this.grades = grades;
      this.targets = new Target[ teacher.numTargets ];
      
      for (int i = 0; i < targets.length; i++) {
        targets[i] = new Target((width/5)*(i+1));
      }
    }
    
    
    void display() {
      for(Note n : notes) {
        n.drawNote();
        n.moveNote(); 
      }
      
      for(Target t : targets)
        t.drawTarget();
    } 
    
    Target[] getTargets() {
      return this.targets;
    }
    
    
}

  //PASS TEACHER SOP IT CAN TELL IT WHAT TO DO 
  //PASS SCOREBOARD AS A PUNCH CARD, TO KEEP TRACK OF TERMINOLOGY
  
  
  //4 || 8 AMOUNT OF TARGET DECIDED BY TEACHER
  
  //BOARD KNOWS ABOUT TEACHER AND SCOREBOARD
