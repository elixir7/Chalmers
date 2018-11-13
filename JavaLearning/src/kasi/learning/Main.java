package kasi.learning;

import java.util.Arrays;

public class Main {

    public static void main(String[] args) {
        //putTester();
        //System.out.println(stringTwin("anna", "patrik"));
        String swag = stringTwinReq("anna","patrik");
        System.out.println(swag);
    }

    /**
     * Shifts all data to the right of given index and then places a number at the index
     * @param arr the array to me modified
     * @param numb the number to be put into the array
     * @param index the position in the array where to put the number
     */
    public static void put(int[] arr,int numb, int index){
        if(index >= arr.length)
            throw new ArrayIndexOutOfBoundsException();
        for(int i = arr.length - 2; i >= index; i-- ){
            arr[i+1] = arr[i];
        }
        arr[index] = numb;
    }

    /**
     * Method for evaluating the method put()
     */
    public static void putTester(){
        int[] arr = new int[10];
        arr[0] = 10;
        arr[1] = 20;
        arr[2] = 30;
        arr[3] = 40;
        System.out.println(Arrays.toString(arr));
        put(arr, 25, 2);

        System.out.println(Arrays.toString(arr));

        int[] arr2 = {1,2,3,4,5,6,7,8,9,10};
        System.out.println(Arrays.toString(arr2));
        put(arr2, 7, 6);
        System.out.println(Arrays.toString(arr2));
        // Function call under throws an exception.
        //put(arr2, 7, 15);
        put(arr2, 7, 0);
        System.out.println(Arrays.toString(arr2));
    }

    /**
     * Reads normal text from a file and prints out the frequency of characters used
     * @param filename the name of the file containing the text. E.g harry_potter.txt
     */
    public static void freqAnalasysText(String filename){
        //Max 100 characters, is there a better way to do it?
        FreqArray freqArray = new FreqArray(new int[100], new char[100]);
        char[] text; // the text in the file
        /*for(char ch : text){
            freqArray.analys(ch);
        }*/

}

    /**
     * Twists to strings together.
     * @param str1 the first string
     * @param str2 the second string
     * @return returns the twinned string
     */
    public static String stringTwin(String str1, String str2){
        String output = "";
        String bigString;
        String smallString;
        if(str1.length() == str2.length()){
            for(int i = str1.length(); i < str1.length(); i++){
                output += str1.charAt(i);
                output += str2.charAt(i);
            }
            return output;
        }else if(str1.length() > str2.length()){
            bigString = str1;
            smallString = str2;
        }else{
            bigString = str2;
            smallString = str1;
        }

        for(int i = 0; i < smallString.length(); i++){
            output += str1.charAt(i);
            output += str2.charAt(i);
        }
        for(int i = smallString.length(); i < bigString.length(); i++){
            output += bigString.charAt(i);
        }
        return output;
    }

    /**
     * Twins two strings together
     * @param str1 The first String
     * @param str2 The Second String
     * @return The twinned String
     */
    public static String stringTwinReq(String str1, String str2){
        System.out.println(str1);
        System.out.println(str2);
        if(str2.length() == 0){
            return str1;
        }else if(str1.length() == 0){
            return str2;
        }else {
            return str1.charAt(0) + str2.charAt(0) +  stringTwinReq(str1.substring(1), str2.substring(1));
        }
    }
}