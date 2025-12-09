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
  //ArrayList<String> patternNames = new ArrayList<>();
  int [] extraTime = {0, 75, 0, 150, 0, 225, 0, 300, 0};

  int lastRhythmTimer, numTargets, targetCount, totalWeight, tempo, numPatterns, consecutivePatterns;
  String lastPattern, lastNote = "";
  boolean saved = false;

  Teacher() {
    setPatternMaps();
    //totalWeight = setTotalWeight();
    numPatterns = 24;
    tempo = 120;
    numTargets = 4;
    targetCount = 4;
    lastRhythmTimer = 0;

  }

  void setPatternMaps() {
    String [] patterns = loadPatterns();
    String [] patternsScores = loadScores();

    for (String p : patterns) {
      String[] sp =  p.split(":");

      patternStrings.put(sp[0], sp[1]);
    }
    
    for (String p : patternsScores) {
      String[] sp =  p.split(" ");
      println(sp[0] + " " + sp[1]);

      patternTracker.put(sp[0], max(1,int(int(sp[1])*0.9)));
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
  
  private String [] loadScores () {
    String [] filesNames = new File(sketchPath()).list();
    try {
      return loadStrings("scores.txt");
    }
    catch (Exception e) {
      return new String []{"    "};
    }
  }


  void saveScore() {
    if (!saved) {
      saved = true;
      File file = new File(sketchPath() + "/scores.txt");
      //chemin = dataPath;
      // positions.txt== your file;
  
      try {
        if (!file.exists()) {
          file.createNewFile();
        }
  
        FileWriter fw = new FileWriter(file, false);///true = append
        PrintWriter pw = new PrintWriter(fw);
        
        int counter = 0;
        for (String p : patternTracker.keySet()) {
          pw.print( ((counter++ == 0) ? "" : "\n") + p + " " + patternTracker.get(p));
          println(p + " " + patternTracker.get(p));
        }
        
        pw.close();
      }
      catch(IOException ioe) {
        System.out.println("Exception ");
        ioe.printStackTrace();
      }
    }
  }
  

  void storeMissed(Note note) {
    //STORES AND NORMALIZES
      if (!lastNote.equals(note.getType())) {
        patternTracker.put(note.getType(), (patternTracker.get(note.getType())+1));
        lastNote = note.getType();
      }
  }

  int setTotalWeight() {
    int max = 0;
    for (int p : patternTracker.values())
      max+=p;
     
    println("Max: " +  max);
    return max;
  }

  private String getRandomPattern() {
    int c = 0;
    int randomNum = (int)random(setTotalWeight());
    for (String p : patternTracker.keySet()) {
      c+=patternTracker.get(p);
      if (randomNum < c) {
        println("Count: " + c);
        return p;
      }
    }
    println("Count (BROKE): " + c);
    return "NONE";
  }
  
  void normalizePatternWeights() {
    for(String pattern : patternStrings.keySet()){
      patternTracker.put(pattern, max(1, int(patternTracker.get(pattern)*0.9)));
    }
  }
  
  ArrayList<Note> createNotes(Target[] targets) {
    ArrayList<Note> notes = new ArrayList<>();
      if (( lastRhythmTimer <= millis() || lastRhythmTimer == 0 )) {
        if (numPatterns% 10 == 0)
          normalizePatternWeights();
        String patternName = getRandomPattern();

        //NOTES PATTERN , DELAY
        
        if (consecutivePatterns >= 3) {
          consecutivePatterns = 0;
          String newPattern = "";
          do {
            newPattern = getRandomPattern();
          } while (newPattern.equals(lastPattern) && !newPattern.equals(""));
          patternName = newPattern;
        } else if (patternName == lastPattern) {
          consecutivePatterns++;  
        } 
        
        lastPattern = patternName;
        numPatterns-=1;
        String [] s = patternStrings.get(patternName).split(",");
        // println(patternName + " (" + s[0].length() + ") " + numPatterns);
        
        lastRhythmTimer = millis() + int(s[1]) + extraTime[int(random(extraTime.length))];
        return stringToNotes(targets, s[0], patternName);
      }
    return new ArrayList<Note>();
  }

  private float setTempo() {
    return 5;
  }

  ArrayList<Note> stringToNotes(Target[] targets, String noteString, String patternName) { //random boolean
    int rows = noteString.length() / 4;
    int start = 0;
    ArrayList<Note> notes = new ArrayList<>();
    start+=(int)random(targets.length);

    for (int i = 0; i < rows; i++) { // this is where we will modify notes
      for ( int j = i*4; j < (i*4)+4; j++) {
        if (noteString.charAt(j) == 'b')
          notes.add(new Note(targets[(j+start)%4].x, -100 - (100*(rows-i)), (tempo/2)/10, patternName));
      }
    }
    return notes;
  }
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
