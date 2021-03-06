import java.io.*;
import javax.swing.*;
import java.util.Scanner;

public class Lab5_skel {

    public static void main(String[] args) {
        //doCollatz();
        //doCommandLine();
        //System.out.println(toRobber("Hej på dig, vad gör du?"));
        //System.out.println(toPigLatin("Hej på dig Eric"));
        //doMi2Mu();
    }

    // -------------------------- 1 ------------------------------
    //before: nothing
    //after: Prints out all steps when performing Collatz Conjecture, on every integer between the supplied integers
    public static void doCollatz() {
        String input = JOptionPane.showInputDialog("Give me a number greater than 2");
        int numbOne = Integer.parseInt(input);
        input = JOptionPane.showInputDialog("Give me a number greater than " + input);
        int numbTwo = Integer.parseInt(input);

        for(int i = numbOne; i < numbTwo; i++){
            boolean finished = false;
            int temp = i;
            while(!finished){
                System.out.print(Integer.toString(temp) + ", ");
                if(temp % 2 == 0){
                    temp = temp / 2;
                }else{
                    temp = temp * 3 + 1;
                }
                if(temp == 1){
                    finished = true;
                    System.out.print(temp);
                }
            }
            System.out.println(", Done!");
        }
    }

    // -----------  2 & 5 --------------------------
    //Starts a commandline program which can translate input to different languages depending on inputs
    public static void doCommandLine() {
        Scanner sc = new Scanner(System.in);
        System.out.println("Give command p or r to give input. Give command q to exit.");
        boolean finished = false;
        while(!finished){
            switch(sc.nextLine()){
                case "r":
                    System.out.println("Input text:");
                    System.out.println(toRobber(sc.nextLine()));
                    break;
                case "p":
                    System.out.println("Input text:");
                    System.out.println(toPigLatin(sc.nextLine()));
                    break;
                case "q":
                    finished = true;
                    break;
                default:
                    System.out.println("Invalid Input");
                    break;
            }

        }
    }

    // -----------------  3 ------------------------------
    //before: nothing
    //after: translates a sentence to "To The Robber Language" and returns it
    public static String toRobber(String text) {
        String output = "";
        char[] sentenceArray = text.toCharArray();
        for(int i = 0; i < sentenceArray.length; i++){
            if(isConsonant(sentenceArray[i])){
                output += sentenceArray[i] + "o" + Character.toLowerCase(sentenceArray[i]);
            }else{
                output += sentenceArray[i];
            }
        }
        return output;
    }

    //Helper Method for toRobber()
    //before: nothing
    //after: returns true is supplied character is a consonant
    public static boolean isConsonant(char ch) {
        String consonantAlphabet = "BCDFGHJKLMNPQRSTVWXZ";
        consonantAlphabet += consonantAlphabet.toLowerCase();
        char[] consonantArray = consonantAlphabet.toCharArray();
        for(int i = 0; i < consonantArray.length; i++){
            if(ch == consonantArray[i]){
                return true;
            }
        }
        return false;
    }

    // ----------------- 4  ------------------------------
    //before: nothing
    //after: translates a sentence to "Pig Latin" and returns it
    public static String toPigLatin(String text){
        String output = "";
        String[] wordArray = text.toLowerCase().split(" ");

        for(int i = 0; i < wordArray.length; i++){
            char[] charWordArray = wordArray[i].toCharArray();
            if(isVowel(charWordArray[0])){
                output += wordArray[i] + "way ";
            }else{
                String preVowelStr = "";
                String postVowelStr = "";
                for(int k = 0; k < charWordArray.length; k++){
                    if(isVowel(charWordArray[k])) {
                        for(int u = 0; u < k; u++){
                            preVowelStr += charWordArray[u];
                        }

                        for(int t = k; t < charWordArray.length; t++){
                            postVowelStr += charWordArray[t];
                        }
                        output += postVowelStr + preVowelStr + "ay ";
                        //Break the for loop
                        break;
                    }
                }
            }
        }
        return output;
    }

    //Helper Method for toPigLatin()
    //before: nothing
    //after: returns true is supplied character is a vowel
    public static boolean isVowel(char ch) {
        String vowelAlphabet = "AEIOUYÅÄÖ";
        vowelAlphabet += vowelAlphabet.toLowerCase();
        char[] vowelArray = vowelAlphabet.toCharArray();
        for(int i = 0; i < vowelArray.length; i++){
            if(ch == vowelArray[i]){
                return true;
            }
        }
        return false;
    }

    // -------------------- 6 -------------------------
    //before: nothing
    //after: solves the muPuzzle by brute force
    //note: "MU" is never found because all instances of I will not be divisible by 3
    //Explanation:
    //From the start we have 1 I which is not divisible by 3.
    //Doubling a number which is not divisible by 3 does not make it divisible by 3.
    //Removing 3 from a number that is not divisible by 3 does not make it divisible by 3.
    //Which means that we can never get "MU" from "MI" by applying the rules.
    public static void doMi2Mu() {

        String startingStr = "MI";
        String[] resultArr = new String[257];
        resultArr[0] = startingStr;
        int tempIndex = 1;
        //Loops 4^3 times becuase each run makes 4 results -> 256
        for (int i = 0; i < 64; i++) {

            //Apply the first rule and and store it in the result array
            resultArr[tempIndex] = rule1(resultArr[i]);
            //Prints out the result to the user
            System.out.println(resultArr[tempIndex]);
            //Checks if "MU" is found
            muChecker(resultArr[tempIndex]);
            //Increase the resultArray Index variable by one so that the next rule can be run
            tempIndex++;

            resultArr[tempIndex] = rule2(resultArr[i]);
            System.out.println(resultArr[tempIndex]);
            muChecker(resultArr[tempIndex]);
            tempIndex++;

            resultArr[tempIndex] = rule3(resultArr[i]);
            System.out.println(resultArr[tempIndex]);
            muChecker(resultArr[tempIndex]);
            tempIndex++;

            resultArr[tempIndex] = rule4(resultArr[i]);
            System.out.println(resultArr[tempIndex]);
            muChecker(resultArr[tempIndex]);
            tempIndex++;
        }
    }

    //before: nothing
    //after: Prints out "FOUND!" if "MU" is found with a dialog box
    public static void muChecker(String str){
        if(str == "MU"){
            JOptionPane.showMessageDialog(null, "FOUND!");
        }
    }

    //before: nothing
    //after: Returns a string where an "U" is added at the end, if the input string ends with "I"
    public static String rule1(String s) {
        char[] charArr = s.toCharArray();
        String transformedString;
        if(charArr[charArr.length - 1] == 'I'){
            transformedString = new String(charArr) + "U";
        }else{
            transformedString = s;
        }
        return transformedString;
    }

    //before: nothing
    //after: Returns a string where everything after the letter "M" is doubled
    public static String rule2(String s) {
        char[] charArr = s.toCharArray();
        String transformedString = s;
        for(int i = 1; i < charArr.length; i++){
            transformedString += charArr[i];
        }
        return transformedString;

    }

    //before: nothing
    //after: Returns a string where all the triplets of I ("III") is replaced by a single "U"
    public static String rule3(String s) {
        char[] charArr = s.toCharArray();
        String transformedString = "";
        for(int i = 0; i < charArr.length; i++){
            if(i < charArr.length - 2){
                if(charArr[i] == 'I' && charArr[i+1] == 'I' && charArr[i+2] == 'I') {
                    transformedString += "U";
                    i += 2;
                }
            }else{
                transformedString += charArr[i];
            }
        }
        return transformedString;
    }

    //before: nothing
    //after: Returns a string where all doubles of U ("UU") is removed
    public static String rule4(String s) {
        char[] charArr = s.toCharArray();
        String transformedString = "";
        for(int i = 0; i < charArr.length; i++){
            //Makes sure we doesn't get indexOutOfBound
            if(i < charArr.length - 1){
                if(charArr[i] == 'U' && charArr[i+1] == 'U'){
                    i += 1;
                }else{
                    transformedString += charArr[i];
                }
            }else{
                transformedString += charArr[i];
            }
        }
        return transformedString;

    }
}
