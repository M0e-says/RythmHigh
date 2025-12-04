//Interface for state objects
interface State {
  void switchToRoam( StateManager manager );
  void switchToScore( StateManager manager );
  void switchToPlay( StateManager manager );
  
  void display();
  void update();
  
  void clickReact();
  void keyReact();
  void keyRelease();
}

class StateManager {
  private State state;
  
  StateManager() {
    this.state = new MenuState();
  }
  
  //Change State
  public void setState(State state) {
    this.state = state;
  }
  
  //States 
  public void switchToRoam() {
    manager.setState(new RoamState());
  }
  
  public void switchToScore() {
    //TAKES SCREENSHOT, DIMS, AND SWITCHES TO SCORE
    manager.setState(new ScoreState());
  }
  
  public void switchToPlay() {
    manager.setState(new PlayState());
  }
  
  public void display() {
    state.display();
  }
  
  public void update() {
    state.update();
  }
    
  public void clickReact() {
    state.clickReact();
  }
  
    
  public void keyReact() {
    state.keyReact();
  }
  
  public void keyRelease() {
    state.keyRelease();
  }
  
}

class MenuState implements State {
  void switchToRoam(StateManager manager) {
    manager.switchToRoam();
  }
  
  void switchToScore(StateManager manager) {
    manager.switchToScore();
  }
  
  void switchToPlay(StateManager manager) {
    manager.switchToPlay();
  }

  void display() {
    rect((width/2)-(width/2)/2, (height/2) - (height/5)/2, (width/2), (height/5));
  }
  
  void update() {}
  
  void clickReact() {
    if (isMouseOn((width/2)-(width/2)/2, (height/2) - (height/5)/2, width/2, height/5))
       switchToPlay(manager);
  }
      
  
  void keyReact() {
    
  }
  
  void keyRelease() {}

}

class RoamState implements State {
  void switchToRoam(StateManager manager) {

  }
  
  void switchToScore(StateManager manager) {

  }
  
  void switchToPlay(StateManager manager) {
    
  }

  void display() {}
  
  void update() {}
  
  void clickReact() {}
  
  void keyReact() {}

  void keyRelease() {}
}

class ScoreState implements State {
  void switchToRoam(StateManager manager) {

  }
  
  void switchToScore(StateManager manager) {

  }
  
  void switchToPlay(StateManager manager) {
    
  }

  void display() {}
  
  void update() {}
  
  void clickReact() {}
  
  void keyReact() {}

  void keyRelease() {}
}



class PlayState implements State {
  void switchToRoam(StateManager manager) {

  }
  
  void switchToScore(StateManager manager) {

  }
  
  void switchToPlay(StateManager manager) {
    
  }

  void display() {
    background(200, 100, 0);
    testBoard.display();
  }
  
  void update() {
    testBoard.update();
  }
  
  void clickReact() {
    
  }
  
  void keyReact() {
    testBoard.checkHits();
  }

  void keyRelease() {
    testBoard.releaseHits();
  }
}
