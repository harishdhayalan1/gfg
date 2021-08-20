import java.util.*;

class PairInRotatedSortedArray {

  boolean hasPair(int[] arr, int sum) {
    int largestIndex = 0;

    // Find largest index.
    for (int i=0; i<arr.length; i++) {
      if (arr[largestIndex] < arr[i])
        largestIndex = i;
    }
    // Assuming array is rotated.
    int smallestIndex = largestIndex + 1;

    // Loop until 2 pointers meet.
    while (largestIndex != smallestIndex) {
      int currentSum = arr[largestIndex] + arr[smallestIndex];
      if(currentSum == sum)
        return true;
      // Move in case of sum not matching.
      if(currentSum > sum)
        largestIndex--;
      else
        smallestIndex++;

      // Adjust if boundary is reached.
      if(smallestIndex == arr.length)
        smallestIndex = 0;

      if(largestIndex < 0)
        largestIndex = arr.length - 1;
    }
    return false;
  }

  public static void main(String[] args) {
    PairInRotatedSortedArray p = new PairInRotatedSortedArray();
    int[] a = new int[]{ 3,4,5,6,7,1,2};
    System.out.println(p.hasPair(a, 8));
    System.out.println(p.hasPair(a, 212));
  }
}
