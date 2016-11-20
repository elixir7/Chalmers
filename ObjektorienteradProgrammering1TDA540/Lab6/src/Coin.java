import java.util.Random;

public class Coin {
    private Random rand;
    public String flip(){
        rand = new Random();
        int number = rand.nextInt(2);
        if(number == 1){
            return "head";
        }else{
            return "tail";
        }
    }

}
