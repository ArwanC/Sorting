void bubble_sort() {
  observing(j, j+1);
  if (rectangles[j].h > rectangles[j+1].h) {
    rectangles[j].swap_with(rectangles[j+1]);
  }
  if (i < rectangles.length) {
    j++;
    if (j >= rectangles.length-i-1) {
      j = 0;
      i++;
    }
  }
  else {
    reset_vars();
    show_rectangles();
    input_key = 'v';
  }
}

void selection_sort() { 
  observing(idx, j);
  if (rectangles[idx].h > rectangles[j].h) {
    idx = j;
  }
  if (i < rectangles.length-1) {
    j++;
    if (j >= rectangles.length) {
      rectangles[idx].swap_with(rectangles[i]);
      i++;
      j = i;
      idx = i;
    }
  }
  else {
    reset_vars();
    show_rectangles();
    input_key = 'v';
  }
}

void insertion_sort() {
  observing(j+1, j);
  if (rectangles[j+1].h < rectangles[j].h) {
    rectangles[j+1].swap_with(rectangles[j]);
    j--;
  }
  else {
    i++;
    j = i;
  }
  if (j < 0) {
    i = i+1;
    j = i;
  }
  if (i >= rectangles.length-1) {
    reset_vars();
    show_rectangles();
    input_key = 'v';
  }
}

void quick_sort(int start, int end) {
  if (start >= end){
    return;
  }
  idx = partition(start, end);
  quick_sort(start, idx-1);
  quick_sort(idx+1, end);
}

int partition(int start, int end) {
  int pivot_idx = start;
  for (int i=start; i<end; i++) {
    observing(i, end);
    if (rectangles[i].h < rectangles[end].h) {
      observing(i, pivot_idx);
      rectangles[i].swap_with(rectangles[pivot_idx]);
      pivot_idx++;
    }
  }
  rectangles[pivot_idx].swap_with(rectangles[end]);
  return pivot_idx;
}
