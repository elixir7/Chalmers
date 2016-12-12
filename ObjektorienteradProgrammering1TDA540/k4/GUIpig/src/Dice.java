import java.util.Random;

/**
 * Super class for any dice (code to reuse
 * if implementing any special kind of dice)
 *
 * Created by hajo on 9/25/14.
 */
public class Dice {

    private final Random rand = new Random();
    private final int faces;
    private int result;

    public Dice(int faces) {
        this.faces = faces;
    }

    public int roll() {
        result = rand.nextInt(faces) + 1;
        return result;
    }

    public int getResult() {
        return result;
    }
}
