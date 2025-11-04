Teacher testTeacher;
Board testBoard;
int tempo = 180*10;

StateManager manager; 



void setup() {
  size(750, 500);
  testTeacher =  new Teacher();
  testBoard = new Board(testTeacher, ScoreBoard.getInstance());
  manager = new StateManager();
}

void draw() { // MOVE TO DISPLAY
  background(200, 100, 0);
  testBoard.display();
  for (Note note : testTeacher.createNotes(testBoard.getTargets())) {
    testBoard.notes.add(note);
  }
}

void keyPressed() {
    for (Target target : testBoard.getTargets()) { // MAKE THIS A FUNCITON IN BOARD, WHICH IS GONNA BE A STATE MANAGER, 
    //eventually become manager.keyResponse(key, keyCode); 
      println( target.checkHit( testBoard.notes ).y);
    }
}


/*
 *GAME STATE NAME* implements GameState
  {
    How to each go to each different state
    how to display itself
    each state needs to know how to react to keyPressed and react to keyReleased
  }

FINAL STATE _________________________________________________________________ DO NOT TOUCH

void draw() {
  manager.display();
  manager.update();
}

void keyPressed() {
  manager.keyReact();
}

void mousePressed() {
  manager.keyReact();
}

*/
