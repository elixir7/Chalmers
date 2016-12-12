import java.util.Random;

/**
 * A dice designed for Pig game (accumulating total)
 * <p>
 * This class inherits from Dice (will save of a few lines of code)
 *
 * @author hajo
 */
public class PigDice extends Dice {

    private int total;

    // No default constructor in Dice, must call super explicit
    public PigDice(int faces) {
        super(faces);
    }

    @Override
    public int roll() {
        super.roll();    // Reuse code from super class
        if (getResult() > 1) {
            total += getResult();
        } else {
            total = 0;
        }
        return getResult();
    }

    public void clear() {
        total = 0;
    }

    public int getTotal() {
        return total;
    }

}
