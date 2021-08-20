class RotationIndexBinarySearch {

    int rotIndex(int[] arr, int low, int high) {
      if ( low < high ) {
        int mid = (low+high) / 2;
        System.out.println(low);
        System.out.println(mid);
        System.out.println(high);
        if (high-low == 1 && arr[high] < arr[low])
          return high;
        if (high-mid == 1 && arr[high] < arr[mid])
          return high;
        if (mid-low == 1 && arr[mid] < arr[low])
          return mid;
        if ( arr[mid] > arr[low] )
          return rotIndex(arr, mid+1, high);
        else
          return rotIndex(arr, low, mid-1);
      }
      return -1;
    }
    int rotationIndex(int[] arr) {
      return rotIndex(arr, 0, arr.length-1);
    }

    public static void main(String[] args) {
      RotationIndexBinarySearch r = new RotationIndexBinarySearch();
      int[] arr = { 3, 4, 5, 6, 7, 8, 9, 1, 2 };
      System.out.println(r.rotationIndex(arr));
    }
}
