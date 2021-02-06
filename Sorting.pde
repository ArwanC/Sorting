import java.util.*;

/*
Inputs:
"Space" - Randomize list
"1" - Bubble Sort
"2" - Selection Sort
"3" - Insertion Sort
"4" - Quick Sort
*/

// Window & rectangles
int win_h = 700;
int win_w = 1200;
int nb_rect = 100;
int thickness = int(win_w/nb_rect);
int height_increment = int((win_h-100)/nb_rect);
char input_key;
Rectangle[] rectangles = new Rectangle[nb_rect];

// Global variables for sorting algorithms
int i = 0;
int j = 0;
int idx = 0;
int comparaisons = 0;
int accesses = 0;
String sort_alg;
boolean launch_thread = true;
SomeRunnable someRunnable = new SomeRunnable();
Thread thread;


void settings() {
  size(win_w, win_h); //  try adding P2D
}

void setup() { 
  shuffle_rectangles();
  show_rectangles();
  reset_vars();
  frameRate(2000);
  noLoop();
}

void draw() {
  if (input_key == '1') {
    sort_alg = "Bubble";
    bubble_sort();
  }
  else if (input_key == '2') {
    sort_alg = "Selection";
    selection_sort();
  }
  else if (input_key == '3') {
    sort_alg = "Insertion";
    insertion_sort();
  }
  else if (input_key == '4') {
    if (launch_thread) {
      sort_alg = "Quick";
      thread = new Thread(someRunnable);
      thread.start();
      launch_thread = false;
    }
    show_rectangles();
  }
  else if (input_key == 'v') {
    if (launch_thread==false) {
      //println("thread stopped");
      //t1.stop();
      launch_thread = true;
    }
    is_sorted();
  }
  else if (input_key == ' ') {
    setup();
  }
  else {
    noLoop();
  }
//saveFrame("frame-######.png");
}

void keyPressed() {
  input_key = key;
  reset_vars();
  reset_counts();
  loop();
}

void reset_vars() {
  i = 0;
  j = 0;
  idx = 0;
}
void reset_counts() {
  comparaisons = 0;
  accesses = 0;
}

void shuffle_rectangles() {
  int[] init_positions = new int[nb_rect];
  for (int i=0; i<init_positions.length; i++) {
      init_positions[i] = i*thickness;
  }
  
  int[] init_heights = new int[nb_rect];
  for (int i=0; i<init_heights.length; i++) {
      init_heights[i] = (i+1)*height_increment;
  }
  Random random = new Random();
  random.nextInt();
  for (int i=0; i<init_heights.length; i++) {
      int change = i + random.nextInt(init_heights.length - i);
      int temp = init_heights[i];
      init_heights[i] = init_heights[change];
      init_heights[change] = temp;
  }
  for (int i=0; i<nb_rect; i++) {    
    rectangles[i] = new Rectangle(init_positions[i],
                                  init_heights[i],
                                  thickness); 
  }
}

void observing(int a, int b) {
  rectangles[a].change_col(color(255, 0, 0));
  rectangles[b].change_col(color(255, 0, 0));
  show_rectangles();
  rectangles[a].change_col(color(255, 255, 255));
  rectangles[b].change_col(color(255, 255, 255));
  comparaisons ++;
}

void show_rectangles() {
  background(0);
  for (int i=0; i<nb_rect; i++) {  
    rectangles[i].display();
  }
  textSize(16);
  fill(255, 255, 255);
  text(sort_alg+" Sort", 20, 30);
  text(String.valueOf(accesses)+" Array accesses", 20, 60);
  text(String.valueOf(comparaisons)+" Comparaisons", 20, 80);
}

void is_sorted() {
  rectangles[i].change_col(color(255, 0, 0));
  rectangles[i+1].change_col(color(255, 0, 0));
  if (rectangles[i].h > rectangles[i+1].h) {
      show_rectangles();
      println("Incorectly sorted");
      noLoop();
  }
  else if (i >= rectangles.length-2) {
      rectangles[i].change_col(color(0, 255, 0));
      rectangles[i+1].change_col(color(0, 255, 0));
      show_rectangles();
      println("Correctly sorted");
      noLoop();
  }
  else {
    rectangles[i].change_col(color(0, 255, 0));
    show_rectangles();
    i++;
  }
}
