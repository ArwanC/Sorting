class Rectangle {
  int x;
  int h;
  int thickness;
  color col;
  
  // Constructor
  Rectangle(int xpos, int hval, int th) {
  x = xpos;
  h = hval;
  thickness = th;
  col = color(255, 255, 255);
  }
  
  void display() {
    fill(col);
    rect(x, height-h, thickness, h);
  }
  
  void change_col(color c){
    col = c;
  }
  
  void swap_with(Rectangle other) {
      accesses = accesses+3;
      int temp_h = h;
      h = other.h;
      other.h = temp_h;
  }
}
