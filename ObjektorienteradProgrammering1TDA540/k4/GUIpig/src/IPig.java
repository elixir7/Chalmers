import java.util.List;

/**
 * Separating GUI and model
 * It would be possible to change implementation of
 * of model without changing GUI, GUI only knows
 * about IPig.  Whatever implements IPig could be used by GUI
 * This is a contract between the GUI and some implementing class
 */
public interface IPig {
    public int roll();
    public void next();
    public void setTotal();
    public boolean gameOver();
    public Player getActualPlayer();
    public List<Player> getPlayers();
}
