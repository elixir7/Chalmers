package kasi.learning;

public class FreqArray {
    public int[] charAnalasys;
    private char[] text;
    private char[] alphabet;

    public FreqArray(char[] chars){
        charAnalasys = new int[50];
        text = chars;
        alphabet = "abcdefghijklmnopqrstuvwxyzåäö".toCharArray();
    }

    public void analys(){
        for(int i = 0; i < text.length; i++){
            for(int j = 0; j < alphabet.length; j++) {
                if (text[i] == alphabet[j]) {
                    charAnalasys[j]++;
                }
            }
        }
    }

    public void distrubution(){
        System.out.println("Bokstav    Antal    Procent");

        double totalChars = text.length;

        for(int i = 0; i < alphabet.length; i ++){
            double percent = charAnalasys[i] / totalChars;
            System.out.println(alphabet[i] + "            " + charAnalasys[i] + "            " + percent*100 + "%");
        }
    }

}
