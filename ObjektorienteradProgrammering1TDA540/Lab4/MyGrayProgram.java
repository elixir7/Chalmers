public class MyGrayProgram {
   public static void main(String[] args) throws Exception{
      int[][] original = GrayImage.read("C:\\Users\\Oskar\\IdeaProjects\\HT16Lab4\\src\\mushroom.jpeg");
      int[][] manipulated = contour(original);
      GrayImage.write("upDownMushroom.jpeg", manipulated);
      GrayImageWindow iw = new GrayImageWindow(original, manipulated);
   }//main 

    //Before: None
    //After: Returns an array mirrored around the x-axis.
   public static int[][] upDown(int[][] samples) {
      int[][] newSamples = new int[samples.length][samples[0].length];
      for (int row = 0; row < samples.length; row = row + 1)
         for (int col = 0; col < samples[row].length; col = col + 1)
            newSamples[row][col] = samples[samples.length - row - 1 ][col];
      return newSamples;
    }//upDown

    //Before: None
    //After: Returns an array mirrored around the y-axis.
   public static int[][] leftRight(int[][] samples){

      int[][] newSamples = new int[samples.length][samples[0].length];
      for (int row = 0; row < samples.length; row++)
         for (int col = 0; col < samples[row].length; col++)
            newSamples[row][col] = samples[row][samples[0].length - col - 1];

      return newSamples;
   }//leftRight

    //Before: None
    //After: Returns an array where each B/W value is inverted.
   public static int[][] invert(int[][] samples){
      int[][] newSamples = new int[samples.length][samples[0].length];
      for (int row = 0; row < samples.length; row++)
         for (int col = 0; col < samples[row].length; col++)
            newSamples[row][col] = 255 - samples[row][col];

      return newSamples;
   }//invert

    //Before: None
    //After: Returns an array where each B/W value is ether 0 or 255.
   public static int[][] toBlackWhite(int[][] samples){
      int[][] newSamples = new int[samples.length][samples[0].length];
      for (int row = 0; row < samples.length; row++)
         for (int col = 0; col < samples[row].length; col++)
            if(samples[row][col]>= 128)
               newSamples[row][col] = 255;
            else
               newSamples[row][col] = 0;

      return newSamples;
   }//toBlackWhite

    //Before: None
    //After: Returns an array with the contours of a picture.
   public static int[][] contour(int[][] samples){
      int[][] newSamples = new int[samples.length][samples[0].length];
      for (int row = 1; row < samples.length-1; row++)
         for (int col = 1; col < samples[row].length-1; col++)
            if((samples[row][col]<= 128) && (samples[row][col + 1] > 128 || samples[row][col - 1] > 128
                                             || samples[row + 1][col] > 128 || samples[row - 1][col] > 128))
               newSamples[row][col] = 0;
            else
               newSamples[row][col] = 255;


       return newSamples;
   }//contour

}//MyGrayProgram