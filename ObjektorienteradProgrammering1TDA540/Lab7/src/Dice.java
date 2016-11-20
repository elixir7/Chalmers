import java.util.Random;

public class Dice {
    private Character[] sides = {'L', 'C', 'R', '.', '.', '.'};
    private Character lastRoll;

    public Character roll(){
        Random rand = new Random();
        Character result = sides[rand.nextInt(6)];
        lastRoll = result;
        return result;
    }

    @Override
    public String toString(){
        return getClass().getSimpleName() + "{" + "lastRoll=" + lastRoll + "}";
    }
}
