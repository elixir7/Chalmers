package kasi.learning;

public class FreqArray {
    public int[] charAnalasys;
    private char[] chars;

    public FreqArray(int[] arr, char[] chars){
        charAnalasys = arr;
        this.chars = chars;
    }

    public void analys(char character){
        for(int i = 0; i < chars.length; i++){
            // If the character exists -> increment the character
            if(chars[i] == character) {
                charAnalasys[i]++;
            }


        }

    }

}
