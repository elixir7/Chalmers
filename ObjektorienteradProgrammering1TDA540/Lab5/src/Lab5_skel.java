import javax.swing.*;
import java.util.Scanner;

public class Lab5_skel {

    public static void main(String[] args) {
        //doCollatz();
        //doCommandLine();
        //System.out.println(toRobber("Hej på dig!"));
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
                case "p":
                    System.out.println("Input text:");
                    System.out.println(toRobber(sc.nextLine()));
                    break;
                case "r":
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
                output += sentenceArray[i] + "o" + sentenceArray[i];
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
        String consonantAlphabet = "BCDFGHJKLMNPQRSTVWXZbcdfghjklmnpqrstvwxz";
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
    public static String toPigLatin(String text) {
        String output = "";
        text = text + " ";
        char[] sentenceArray = text.toCharArray();
        //Min will become the index for the start of a word
        int min = 0;
        //Max will become the index for the end of a word
        int max = 0;
        int vowelIndex;
        for(int i = 0; i < sentenceArray.length; i++){
            //A space marks the end of a word.
            if(sentenceArray[i] == ' '){
                max = i;
                //If the first letter of the word is a Vowel, apply the first rule
                if(isVowel(sentenceArray[min])){
                    String tempVowelStr = "";
                    for(int k = min; k < max; k++){
                        tempVowelStr += sentenceArray[k];
                    }
                    output += tempVowelStr + "way ";
                    //Sets the new min to the start of the next word
                    min = max + 1;
                } else{
                    String preVowelStr = "";
                    String postVowelStr = "";
                    //Remove the preVowel part from the word and add it to the end, then add "ay"
                    for(int h = min; h < max; h++){
                        if(isVowel(sentenceArray[h])) {
                            for(int u = h; u < max; u++){
                                preVowelStr += sentenceArray[u];
                            }
                            for(int t = min; t < h; t++){
                                postVowelStr += sentenceArray[t];
                            }
                            output += preVowelStr + postVowelStr + "ay ";
                        }
                    }
                    //Sets the new min to the start of the next word
                    min = max + 1;
                }

            }
        }
        return output;
    }

    //Helper Method for toPigLatin()
    //before: nothing
    //after: returns true is supplied character is a vowel
    public static boolean isVowel(char ch) {
        String vowelAlphabet = "AEIOUYÅÄÖaeiouyåäö";
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
    public static void doMi2Mu() {
        String startingStr = "MI";
        String[] resultArr = new String[257];
        resultArr[0] = startingStr;
        int tempIndex = 1;
        //Loops 4^3 times becuase each run makes 4 results -> 256
        for (int i = 0; i < 64; i++) {

            resultArr[tempIndex] = rule1(resultArr[i]);
            System.out.println(resultArr[tempIndex]);
            muChecker(resultArr[tempIndex]);
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
    //after: Prints out "FOUND!" if "MU" is found
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
                if(charArr[i] == 'I'){
                    if(charArr[i+1] == 'I'){
                        if(charArr[i+2] == 'I'){
                            transformedString += "U";
                            i += 2;
                        }
                    }
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
                if(charArr[i] == 'U'){
                    if(charArr[i+1] == 'U'){
                        i += 1;
                    }
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
