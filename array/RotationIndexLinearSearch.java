class RotationIndexLinearSearch {
    int rotationIndex(int[] arr) {
      int index = 0;
      while(index < arr.length-1) {
        if(arr[index+1] < arr[index])
          return index+1;
        index++;
      }
      return 0;
    }

    public static void main(String[] args) {
      RotationIndexLinearSearch r = new RotationIndexLinearSearch();
      int[] a = { 2, 3, 4, 1 };
      System.out.println(r.rotationIndex(a));
      int[] b = { 1, 2, 3, 4 };
      System.out.println(r.rotationIndex(b));
      int[] c = { 3, 4, 1, 2 };
      System.out.println(r.rotationIndex(c));
      int[] d = {7, 9, 11, 12, 5};
      System.out.println(r.rotationIndex(d));
    }
}
