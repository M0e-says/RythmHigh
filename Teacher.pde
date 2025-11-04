//FACTORY
class Teacher {
  /* 
  create a hashmap that every teacher has, that is tied to how many times a Rhythm has been succeded 
  <String, Interger>
  */
  
  int lastRhythmTimer = 0;
  int numTargets = 4;
  String [] patterns;
  
  Teacher() {
    patterns = loadPatterns();
  }
  
  Note createNote(Target[] targets) {
    return new Note(targets[(int)random(targets.length)].x, setTempo());
  }

  private String [] loadPatterns () {
    String [] filesNames = new File(sketchPath()).list();
    for(String s: filesNames) {
      println(s);
    }
    try {
       return loadStrings("patterns.txt");
    } catch (Exception e) {
      println("didnt work lmao");
      return new String []{"    "};  
    }
  }
  
  ArrayList<Note> createNotes(Target[] targets) {
    ArrayList<Note> notes = new ArrayList<>();
    
    if ( lastRhythmTimer <= millis() || lastRhythmTimer == 0) {
      lastRhythmTimer = millis() + 1800;
       return stringToNotes(targets, patterns[(int)random(patterns.length)]);
    }
    
    /*WILL CHANGE BASED ON TYPE hello 
    
    switch () {
      case :  notes.add(createNote())//TRIP Break;
      case :  //D2D Break;
    }
    
    */
    return new ArrayList<Note>();
   
    
    //return notes;
  }
  
  private float setTempo() {
    return 5;
  }
  
  ArrayList<Note> stringToNotes(Target[] targets, String noteString) { //random boolean
    int rows = noteString.length() / 4;
    int start = 0;
    ArrayList<Note> notes = new ArrayList<>();
    //start+=(int)random(targets.length);
      
    for(int i = 0; i < rows; i++) { // this is where we will modify notes
       for ( int j = i*4; j < (i*4)+4; j++) {
         if(noteString.charAt(j) == 'b')
           notes.add(new Note(targets[(j+start)%4].x, -100 - (100*(rows-i)), 5));
       }
    }
    return notes;
  } 
  
  //DIFFERENT METHOD FROM EVERY TYPE
  //ROW, DIAG, COLUMN, PAIR, 
  
  //ArrayList<Note> createRow(Target[] targets /* int whatNote, Diff whatDiff*/) {
  //   ArrayList<Note> notes = new ArrayList<>();
     
  //   for(int i = 0; i < targets.length; i++) {
  //     notes.add(0, new Note(targets[i].x, setTempo()));
  //     //TYPE NOTE WILL REPORT (FOR RECORDING)
  //     notes.get(0).applyType(Type.ROW);
  //     //THIS IS WHERE WE ILL APPLY DIFF FOR LATER
  //     notes.get(0).applyDiff(Diff.NONE);
  //   }
     
  //   return notes;
  //}
  
}  

//METHOD 
    //GET NOTES
    //GET NEXT RYTHM, RETURNS NEXT RYHTM 

  
  //RECORD FOR LEARNING
    //TEACHER NEEDS TO BE TOLD ABOUT NOTEs
      // IE IF IT WAS INEFFECTIVE OR EFFECITVE
      // 
