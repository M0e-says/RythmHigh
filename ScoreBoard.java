//REPORTING SYSTEM (SingleTon)
class ScoreBoard {
  private static ScoreBoard instance; // IF EAGER, SET FINAL AND CREATE HERE (new ScoreBoard); Capital "Instance" cuz final;
  private ScoreBoard() {}
  static ScoreBoard getInstance() {
    if(instance == null) {
      instance = new ScoreBoard();
    } 
    return instance; 
  }
}  

  //GETS INFO FROM BOARD
  
  //GRADE (A, B, C, D, E)
  //MISSED
  
  
