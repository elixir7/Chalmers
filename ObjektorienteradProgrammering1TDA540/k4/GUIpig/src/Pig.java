import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * The Pig game. Main functionality here
 *
 * This class implements the contract IPig
 * (it's a subclass to IPig, it's type compatible with IPig)
 *
 * @author hajo
 */
public class Pig implements IPig {

    private final List<Player> players;
    private final PigDice dice;
    private final int maxPoints;
    private Player actualPlayer;

    public Pig(List<Player> playes, PigDice dice, int maxPoints) {
        this.players = playes;
        this.dice = dice;
        this.maxPoints = maxPoints;
        int playerNo = new Random().nextInt(players.size());
        this.actualPlayer = players.get(playerNo);
    }

    public int roll() {
        return actualPlayer.roll();
    }

    public Player getActualPlayer() {
        return actualPlayer;
    }

    public List<Player> getPlayers() {
        return players;
    }



    public void next() {
        dice.clear();
        int i = players.indexOf(actualPlayer);
        actualPlayer = players.get((i + 1) % players.size());
    }

    public void setTotal() {
        actualPlayer.addPoints(dice.getTotal());
    }

    public boolean gameOver() {
        return actualPlayer.getTotal() >= maxPoints;
    }

    // Used to end game directly (not after the round). NOT USED
    public boolean gameOver(int result) {
        return actualPlayer.getTotal() + result >= maxPoints;
    }

}
