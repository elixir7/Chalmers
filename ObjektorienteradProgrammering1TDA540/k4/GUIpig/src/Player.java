/**
 * A single player
 *
 * @author hajo
 */
public class Player {

    private final String name;
    private final PigDice dice;
    private int total;

    public Player(String name, PigDice dice) {
        this.name = name;
        this.dice = dice;
    }

    public String getName() {
        return name;
    }

    public int getTotal() {
        return total;
    }

    public void addPoints(int points) {
        total += points;
    }

    @Override
    public String toString() {
        return "{" + name + " : " + total + "}";
    }

    public int roll() {
        return dice.roll();
    }

    /*
    *   This is important because we will use Player
    *   as a "key" in a Map. Map will use hasCode and equals to
    *   find the player (else possible lost some where in the Map)
     */
    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) { // No subclass allowed
            return false;
        }
        Player other = (Player) o;
        return this.name.equals(other.name);
    }

    @Override
    public int hashCode() {
        return name.hashCode();  // USe Strings hashCode
    }
}
