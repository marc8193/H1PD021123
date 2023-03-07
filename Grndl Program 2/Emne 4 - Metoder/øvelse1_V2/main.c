#include <stdio.h>
#include <stdint.h>

void swap(uint32_t* x, uint32_t* y) {
  uint32_t z = *x;
  *x = *y;
  *y = z;
}

// find partition
uint32_t partition(uint32_t array[], uint32_t low, uint32_t high) {
  
  // rightmost element as pivot
  uint32_t pivot = array[high];
  
  // cursor for greater element
  uint32_t i = (low - 1);

  // traverse each element compare with pivot
  for (uint32_t j = low; j < high; j++) {
    if (array[j] <= pivot) {
        
      // if element smaller than pivot swap with the greater element
      i++;
      
      // swap elements
      swap(&array[i], &array[j]);
    }
  }

  // swap pivot element
  swap(&array[i + 1], &array[high]);
  
  // return partition
  return (i + 1);
}

void quickSort(uint32_t array[], uint32_t low, uint32_t high) {
  if (low < high) {
    
    // find pivot
    uint32_t pi = partition(array, low, high);
    
    // left of pivot recursive call
    quickSort(array, low, pi - 1);
    
    // right of pivot recursive call
    quickSort(array, pi + 1, high);
  }
}

void printArray(uint32_t array[], uint32_t size) {
  for (uint32_t i = 0; i < size; ++i) {
    if (i != size - 1) {
        printf("%d, ", array[i]);
    } else {
        printf("%d ", array[i]);
    }
  }
  printf("\n");
}

uint32_t main(void) {
  uint32_t data[] = {100, 20, 70, 1, 5, 9, 6};
  
  uint32_t elements = sizeof(data) / sizeof(data[0]);
  
  printf("Before:\n");
  printArray(data, elements);
  
  quickSort(data, 0, elements - 1);
  
  printf("After: \n");
  printArray(data, elements);
}