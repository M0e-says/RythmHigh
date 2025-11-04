//Make sure that notes dont overlap
  //Recording location of the top most note, and only create notes above that(?)
class Target {
  int x, y;
  
  Target(int x) {
    this.x = x;
    this.y = height-100;
  }
  
  Note checkHit(ArrayList<Note> notes) {
    for(Note n: notes) {
      if (dist(x, y, n.x, n.y) < (75.0/2)) {
        return n;
      }
    }
    return null;
  }
 
  
  void drawTarget() {
    push();
    fill(0, 200, 0);
    circle(x,y, 75);
    pop();
  }
  
}
