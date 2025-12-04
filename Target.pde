//Make sure that notes dont overlap
  //Recording location of the top most note, and only create notes above that(?)
class Target {
  int x, y;
  boolean pressed;
  color targetColor = color(0, 200, 0);
 
  //Animation
  int animationTimer;
  //can I get checked?
  
  Target(int x) {
    this.x = x;
    this.y = height-100;
    this.pressed = false;
  }
  
  void checkHit(ArrayList<Note> notes) {
    if(!pressed) {
      for(Note n: notes) {
        if (dist(x, y, n.x, n.y) < 65) {
          //STAMP NOTE
          println("NOTE HIT, " + (x/200)+1);
          //SEND TO TEACHER FOR RECORD
          n.success = true;
        }
      }  
    }
    this.pressed = true;
  }
  
  void releaseHit () {
    this.pressed = false;
    targetColor = color(0, 200, 0);
  }
 
  
  void drawTarget() {
    float sizeModifier = 1;
    
    push();
    if( millis() < animationTimer) { // 200, 100 up & 100 down
      float value = abs(animationTimer-millis()-100);
      // +1 so it returns to 1 not 0
      sizeModifier = 1 + (0.5 - ( value/150 ) );
    }
      
    fill(targetColor);  
    circle(x,y, 75*sizeModifier);
    pop();
  }
  
  void animateTarget() {
    animationTimer=millis()+200;
  }
}
