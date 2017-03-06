//*******************************************************************
// NOTE: please read the 'More Info' tab to the right for shortcuts.
//*******************************************************************

import java.lang.Math; // headers MUST be above the first class

// one class needs to have a main() method
public class RLE
{
    // arguments are passed using the text field below this editor
    public static void main(String[] args)
    {
        System.out.println(compress("AAAAAAAAAABBBBBBBJJJJJK"));
    }

    public static String compress(String input){
        char[] charArr = input.toCharArray();
        char lastCh = charArr[0];
        int count = 1;
        String result = "";

        for(int i = 1; i < charArr.length; i++){

            if(lastCh == charArr[i]){
                count++;
            }else{
                result = result + Integer.toString(count) + lastCh;
                count = 1;
            }
            lastCh = charArr[i];

            if(i == charArr.length - 1){
                result = result + Integer.toString(count) + lastCh;
            }
        }
        return result;
    }


}