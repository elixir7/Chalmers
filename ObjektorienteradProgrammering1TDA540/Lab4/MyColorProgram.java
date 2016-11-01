public class MyColorProgram {
    public static void main(String[] args) throws Exception {
        int[][][] original = ColorImage.read("C:\\Users\\Oskar\\IdeaProjects\\HT16Lab4\\src\\mushroom.jpeg");
        int[][][] manipulated = invert(sobel(original));
        ColorImage.write("upDownMushroom.jpeg", manipulated);
        ColorImageWindow iw = new ColorImageWindow(original, manipulated);
    }//main

    //Before: None
    //After: Returns an array mirrored around the x-axis.
    public static int[][][] upDown(int[][][] samples) {
        int[][][] newSamples = new int[samples.length][samples[0].length][3];
        for (int row = 0; row < samples.length; row = row + 1)
            for (int col = 0; col < samples[row].length; col = col + 1)
                for (int c = 0; c < samples[row][col].length; c = c + 1)
                    newSamples[row][col][c] = samples[samples.length - row - 1][col][c];
        return newSamples;
    }//upDown


    //Before: None
    //After: Returns an array mirrored around the y-axis.
    public static int[][][] leftRight(int[][][] samples) {

        int[][][] newSamples = new int[samples.length][samples[0].length][3];
        for (int row = 0; row < samples.length; row++)
            for (int col = 0; col < samples[row].length; col++)
                for (int c = 0; c < samples[row][col].length; c++)
                    newSamples[row][col][c] = samples[row][samples[0].length - col - 1][c];


        return newSamples;
    }//leftRight


    //Before: None
    //After: Returns an array where each colour value is inverted.
    public static int[][][] invert(int[][][] samples) {

        int[][][] newSamples = new int[samples.length][samples[0].length][3];
        for (int row = 0; row < samples.length; row++)
            for (int col = 0; col < samples[row].length; col++)
                for (int c = 0; c < samples[row][col].length; c++)
                    newSamples[row][col][c] = 255 - samples[row][col][c];

        return newSamples;
    }//invert

    //Before: None
    //After: Returns an array where each color value represents the luminescence value.
    public static int[][][] toGray(int[][][] samples) {
        int[][][] newSamples = new int[samples.length][samples[0].length][3];
        for (int row = 0; row < samples.length; row++)
            for (int col = 0; col < samples[row].length; col++) {
                int L = (int) (samples[row][col][0] * 0.299 + samples[row][col][1] * 0.587 + samples[row][col][2] * 0.114);
                for (int c = 0; c < samples[row][col].length; c++)
                    newSamples[row][col][c] = L;
            }

        return newSamples;

    }//toGray


    //Before: None
    //After: Returns an array where each color value is ether 0 or 255.
    public static int[][][] toBlackWhite(int[][][] samples) {

        int[][][] newSamples = new int[samples.length][samples[0].length][3];
        for (int row = 0; row < samples.length; row++)
            for (int col = 0; col < samples[row].length; col++) {
                int L = (int) (samples[row][col][0] * 0.299 + samples[row][col][1] * 0.587 + samples[row][col][2] * 0.114);
                for (int c = 0; c < samples[row][col].length; c++)
                    if (L < 128)
                        newSamples[row][col][c] = 0;
                    else
                        newSamples[row][col][c] = 255;
            }

        return newSamples;
    }//toBlackWhite


    //Before: None
    //After: Returns an extremely sharpened image.
    public static int[][][] sharpenOne(int[][][] samples) {

        int v;
        int[][][] newSamples = new int[samples.length][samples[0].length][3];
        for (int row = 1; row < samples.length-1; row++)
            for (int col = 1; col < samples[row].length-1; col++)
                for (int c = 0; c < samples[row][col].length; c++) {
                    v = (- samples[row - 1][col - 1][c] - samples[row - 1][col][c] - samples[row - 1][col + 1][c]
                         - samples[row][col - 1][c] + 9 * samples[row][col][c] - samples[row][col + 1][c]
                         - samples[row + 1][col - 1][c] - samples[row + 1][col][c] - samples[row + 1][col + 1][c]);

                    if (v < 0)
                        newSamples[row][col][c] = 0;
                    else if (v > 255)
                        newSamples[row][col][c] = 255;
                    else
                        newSamples[row][col][c] = v;
                }

        return newSamples;
    }//sharpenOne


    //Before: None
    //After: Returns an sharpened image.
    public static int[][][] sharpenTwo(int[][][] samples){

        int v;
        int[][][] newSamples = new int[samples.length][samples[0].length][3];
        for (int row = 1; row < samples.length-1; row++)
            for (int col = 1; col < samples[row].length-1; col++)
                for (int c = 0; c < samples[row][col].length; c++) {
                    v = (5 * samples[row][col][c] - samples[row - 1][col][c]
                           - samples[row][col - 1][c] - samples[row][col + 1][c] - samples[row + 1][col][c]);

                    if (v < 0)
                        newSamples[row][col][c] = 0;
                    else if (v > 255)
                        newSamples[row][col][c] = 255;
                    else
                        newSamples[row][col][c] = v;
                }

        return newSamples;
    }//sharpenTwo


    //Before: None
    //After: Returns an image with applied sobel-filter.
    public static int[][][] sobel(int[][][] samples){


        int x, y, v;
        int[][][] newSamples = new int[samples.length][samples[0].length][3];
        for (int row = 1; row < samples.length-1; row++)
            for (int col = 1; col < samples[row].length-1; col++)
                for (int c = 0; c < samples[row][col].length; c++) {
                    x = (- samples[row - 1][col - 1][c] - (2*samples[row - 1][col][c]) - samples[row - 1][col + 1][c]
                         + samples[row + 1][col - 1][c] + (2*samples[row + 1][col][c]) + samples[row + 1][col + 1][c]);

                    y = (- samples[row - 1][col - 1][c] - (2*samples[row][col - 1][c]) - samples[row + 1][col - 1][c]
                         + samples[row - 1][col + 1][c] + (2*samples[row][col + 1][c]) + samples[row + 1][col + 1][c]);


                    v = (int)Math.sqrt(Math.pow(x,2) + Math.pow(y,2));

                    if (v < 0)
                        newSamples[row][col][c] = 0;
                    else if (v > 255)
                        newSamples[row][col][c] = 255;
                    else
                        newSamples[row][col][c] = v;
                }

        return newSamples;
    }//sobel

}//MyColorProgram