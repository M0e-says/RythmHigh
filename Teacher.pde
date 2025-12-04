//FACTORY //<>// //<>//
import java.io.FileWriter;
import java.io.*;
FileWriter fw;

class Teacher {
  /*
   create a hashmap that every teacher has, that is tied to how many times a Rhythm has been succeded
   <String, Interger>
   */

  HashMap<String, Integer> patternTracker = new HashMap<>();
  HashMap<String, String> patternStrings = new HashMap<>();

  ArrayList<Note> missedNotes = new ArrayList<>();
  int lastRhythmTimer = 0;
  int numTargets = 4;
  int targetCount = 4;
  int totalWeight;
  int tempo = 120;
  int num = 10;

  Teacher() {
    setPatternMaps();
    totalWeight = setTotalWeight();
  }

  void setPatternMaps() {
    String [] patterns = loadPatterns();
    
    for (String p : patterns) {
      String[] sp =  p.split(":");
      
      patternStrings.put(sp[0], sp[1]);
      patternTracker.put(sp[0], 1);
    }
    
    
  }

  private String [] loadPatterns () {
    String [] filesNames = new File(sketchPath()).list();
    try {
      return loadStrings("patterns.txt");
    }
    catch (Exception e) {
      return new String []{"    "};
    }
  }


  void saveScore() {
    File file = new File(sketchPath() + "/scores.txt");
    //chemin = dataPath;
    // positions.txt== your file;
    try {
      if (!file.exists()) {
        file.createNewFile();
      }

      FileWriter fw = new FileWriter(file, false);///true = append
      PrintWriter pw = new PrintWriter(fw);

      for (String p : patternTracker.keySet()) {
        
        pw.println(p + " " + patternTracker.get(p));
        println(p + " " + patternTracker.get(p));
        //pw.println(p + ", " + patternS.get(p));
      }


      pw.close();
    }
    catch(IOException ioe) {
      System.out.println("Exception ");
      ioe.printStackTrace();
    }
  }


  void storeMissed(Note note) {
    missedNotes.add(note);
  }

  int setTotalWeight() {
    int max = 0;
    for (int p : patternTracker.values())
      max+=p;

    return max;
  }

  private String getRandomPattern(int max) {
    int c = 0;
    int randomNum = (int)random(max);
    for (String p : patternTracker.keySet()) {
      c+=patternTracker.get(p);
      if (randomNum < c) {
        return p;
      }
    }
    return "";
  }



  ArrayList<Note> createNotes(Target[] targets) {
    ArrayList<Note> notes = new ArrayList<>();
    if (num <= 1) {
      saveScore();
      println(num);
    } else if (( lastRhythmTimer <= millis() || lastRhythmTimer == 0 )) {

      //NOTES PATTERN , DELAY

      String [] s = patternStrings.get(getRandomPattern(totalWeight)).split(",");
      lastRhythmTimer = millis() + int(s[1]);
      num-=1;
      println(num);
      
      return stringToNotes(targets, s[0]);
    }
      
    return new ArrayList<Note>();
  }

  private float setTempo() {
    return 5;
  }

  ArrayList<Note> stringToNotes(Target[] targets, String noteString) { //random boolean


    int rows = noteString.length() / 4;
    int start = 0;
    ArrayList<Note> notes = new ArrayList<>();
    //start+=(int)random(targets.length);

    for (int i = 0; i < rows; i++) { // this is where we will modify notes
      for ( int j = i*4; j < (i*4)+4; j++) {
        if (noteString.charAt(j) == 'b')
          notes.add(new Note(targets[(j+start)%4].x, -100 - (100*(rows-i)), 5));
      }
    }
    return notes;
  }

  //DIFFERENT METHOD FROM EVERY TYPE
  //ROW, DIAG, COLUMN, PAIR,

  //Note createNote(Target[] targets) {
  //  return new Note(targets[(int)random(targets.length)].x, setTempo());
  //}

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
enum Type {
  NONE, TRIP, ROW, DIAG, COLUMN, PAIR, SPAIR
}

//METHOD
//GET NOTES
//GET NEXT RYTHM, RETURNS NEXT RYHTM


//RECORD FOR LEARNING
//TEACHER NEEDS TO BE TOLD ABOUT NOTEs
// IE IF IT WAS INEFFECTIVE OR EFFECITVE
//
