import java.util.Random;

public class Dice {
    private final Character[] SIDES = {'L', 'C', 'R', '.', '.', '.'};
    private Character lastRoll;
    private Random rand;

    public void roll(){
        rand = new Random();
        lastRoll = SIDES[rand.nextInt(6)];
    }

    public Character getLastRoll(){
        return lastRoll;
    }

}
