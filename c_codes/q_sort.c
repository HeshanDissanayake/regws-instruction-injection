#include <stdio.h>

// Function to swap two elements
void swap(int* a, int* b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

// Partition function for quicksort
int partition(int arr[], int low, int high) {
    int pivot = arr[high];    // Pivot element
    int i = (low - 1);  // Index of smaller element

    for (int j = low; j <= high - 1; j++) {
        if (arr[j] < pivot) {
            i++;    // Increment index of smaller element
            swap(&arr[i], &arr[j]);
        }
    }
    swap(&arr[i + 1], &arr[high]);
    return (i + 1);
}

// Quicksort function
void quickSort(int arr[], int low, int high) {
    if (low < high) {
        int pi = partition(arr, low, high);

        quickSort(arr, low, pi - 1);  // Before pi
        quickSort(arr, pi + 1, high); // After pi
    }
}

// Function to print an array
void printArray(int arr[], int size) {
    for (int i = 0; i < size; i++)
        printf("%d ", arr[i]);
    printf("\n");
}

// Test the quicksort with 64 elements
int main() {
    int arr[64] = {
        64, 34, 25, 12, 22, 11, 90, 54, 87, 23, 78, 56, 99, 1, 18, 30,
        45, 63, 72, 82, 91, 4, 37, 15, 49, 6, 27, 43, 53, 68, 10, 36,
        28, 65, 77, 39, 94, 60, 41, 74, 35, 50, 31, 70, 93, 16, 19, 88,
        71, 20, 14, 13, 48, 5, 17, 42, 84, 75, 67, 55, 38, 92, 8, 69
    };
    int n = sizeof(arr) / sizeof(arr[0]);

    printf("Unsorted array:\n");
    printArray(arr, n);

    quickSort(arr, 0, n - 1);

    printf("\nSorted array:\n");
    printArray(arr, n);
    
    return 0;
}
