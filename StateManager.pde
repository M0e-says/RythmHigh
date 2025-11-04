//Interface for state objects
interface State {
  void switchToRoam( StateManager manager );
  void switchToScore( StateManager manager );
  void switchToPlay( StateManager manager );
  
  void display();
  void update();
  
  void clickReact();
  void releaseReact();
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
    state.switchToRoam(this);
  }
  
  public void switchToScore() {
    //TAKES SCREENSHOT, DIMS, AND SWITCHES TO SCORE
    state.switchToScore(this);
  }
  
  public void switchToPlay() {
    state.switchToPlay(this);
  }
  
  public void display() {
    state.display();
  }
  
  public void update() {
    state.update();
  }
    
  public void clickReact() {
    state.update();
  }
  
    
  public void keyReact() {
    state.update();
  }
  
}

class MenuState implements State {
  void switchToRoam(StateManager manager) {

  }
  
  void switchToScore(StateManager manager) {

  }
  
  void switchToPlay(StateManager manager) {
    
  }

  void display() {}
  
  void update() {}
  
  void clickReact() {}
  
  void releaseReact() {}

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
  
  void releaseReact() {}

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
  
  void releaseReact() {}

}



class PlayState implements State {
  void switchToRoam(StateManager manager) {

  }
  
  void switchToScore(StateManager manager) {

  }
  
  void switchToPlay(StateManager manager) {
    
  }

  void display() {}
  
  void update() {}
  
  void clickReact() {}
  
  void releaseReact() {}

}
