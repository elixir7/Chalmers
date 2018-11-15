package kasi.learning;

import java.io.FileNotFoundException;
import java.io.File;

import java.util.Arrays;
import  java.util.Scanner;


public class Main {

    public static void main(String[] args) {
        //putTester();
        //System.out.println(stringTwinReq("anna", "patrik"));
        //System.out.println(stringTwin("anna","patrik"));
        //System.out.println(stringTwin("osvald","isak"));
        //System.out.println(stringTwin("ann-sophie","lotta"));
        //freqAnalasysText("text.txt");
        //Date date = new Date(2100, 7, 10);
        //Date date1 = new Date(2018, 11, 15); //Torsdag
        //System.out.println(date.weekDay());
        //System.out.println(date1.weekDay());
        //randomTester();
        System.out.println(binomialK(4,2));
        System.out.println(binomialK(8,5));

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
        try{
            Scanner in = new Scanner(new File(filename));
            StringBuilder sb = new StringBuilder();
            while(in.hasNext()) {
                sb.append(in.next());
            }
            in.close();
            String outString = sb.toString();
            //all characters are in the file
            char[] text = outString.toLowerCase().toCharArray();
            System.out.println(text);

            FreqArray freqArray = new FreqArray(text);
            freqArray.analys();
            freqArray.distrubution();

        }catch (FileNotFoundException fail){
            System.out.println("File not found!");
        }
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
        if(str1.isEmpty() || str2.isEmpty()){
            return str1 + str2;
        } else {
            return "" + str1.charAt(0) + str2.charAt(0) +  stringTwinReq(str1.substring(1), str2.substring(1));
        }
    }

    public static void randomTester(){
        int[] freq = new int[28];
        int n = 10000000;

        for(int i = 0; i < n; i++){
            freq[Random.random(0,freq.length)]++;
        }

        for(int i = 0; i < freq.length; i++){
            System.out.println(i + " : " + 100d*freq[i]/n + "%");
        }
    }

    public static int binomialK(int n, int k){
        if(k < 0 || n < k){
            return 0;
        }else if (k == 0 || n == k){
            return 1;
        }else{
            return binomialK(n-1,k-1) + binomialK(n-1, k);
        }
    }

}