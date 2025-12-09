 // DONE: track when target pressed using boolean, switch back when released (Target Data) 
 // Done (SOMEWHAT) Send missed notes back to Teacher, store that data somehow

 
//  MEH idk i could do better. bad result on miss
//  class timers - how long / how many patterns sent

/*
If you dont miss a note very often, then it will up the amount of patterns sent in a row, 
if you're not doing so hot then itll go down.
*/

Teacher testTeacher;
Board board;
int tempo = 180*10;

StateManager manager; 

void setup() {
  size(750, 500);
  //fullScreen();
  testTeacher =  new Teacher();
  board = new Board(testTeacher, ScoreBoard.getInstance());
  manager = new StateManager();
}

void draw() {
  manager.display();
  manager.update();
}

void keyPressed() {
  manager.keyReact();
}

void keyReleased() {
  manager.keyRelease();
}

void mousePressed() {
  manager.clickReact();
}



boolean isMouseOn(int x, int y, int w, int h) {
  if (mouseX > x && mouseY > y) 
    if (mouseX < (x+w) && mouseY < (y+h))
      return true;
  return false;
}

//void draw() { // MOVE TO DISPLAY

//}

//void keyPressed() {
//    // MAKE THIS A FUNCITON IN BOARD, WHICH IS GONNA BE A STATE MANAGER, 
//    //eventually become manager.keyResponse(key, keyCode); 

//}


/*
 *GAME STATE NAME* implements GameState
  {
    How to each go to each different state
    how to display itself
    each state needs to know how to react to keyPressed and react to keyReleased
  }

FINAL STATE _________________________________________________________________ DO NOT TOUCH


*/
