import java.util.Random;
public class Dice {
    private int sides;
    private int lastRoll;
    private Random rand;

    public Dice(int sides){
        this.sides = sides;
    }

    public Dice(){
        this.sides = 6;
    }

    public int roll(){
        rand = new Random();
        lastRoll = rand.nextInt(sides) + 1;
        return lastRoll;
    }

    public String rollWithout(int excep){
        int result = roll();
        while(result == excep){
            result = roll();
        }
        return Integer.toString(excep) + ":" + Integer.toString(result);
    }

    @Override
    public String toString() {
        return getClass().getSimpleName() + "{" + "result=" + lastRoll + "}";
    }
}
