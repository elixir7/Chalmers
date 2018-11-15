package kasi.learning;

public class Random {

    public static int random(int min, int max){
        int random =  (int) (min + (max-min) * Math.random());
        return random;
    }
}
