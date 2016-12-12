import java.util.ArrayList;
import java.util.List;

/**
 * Created by hajo on 9/21/14.
 */
public class Test {

    public static void main(String[] args) {
        System.out.println("Test Start");
        rollDiceAndGetTotal();
        pigNextPlayer();
        System.out.println("Test Finished");
    }

    // ----- Test Dice --------
    private static void rollDiceAndGetTotal() {
        PigDice d = new PigDice(6);
        int total = 0;
        while( true ){
            int r = d.roll();
            if( r > 1){
                total = total + r;
                assertEquals( total, d.getTotal());
            }else{
                assertEquals( 0, d.getTotal());
                break;
            }
        }

    }

    // ------ Test Pig ------------
    private static void pigNextPlayer() {
        PigDice dice = new PigDice(6);
        List<Player> players = new ArrayList<>();
        players.add(new Player("Anna", dice));
        players.add(new Player("Urban", dice));
        players.add(new Player("Fia", dice));
        Pig pig = new Pig(players, new PigDice(6), 20);
        Player actual = pig.getActualPlayer();
        for( Player p : pig.getPlayers()){
            pig.next();
        }
        assertEquals(actual, pig.getActualPlayer());

    }


    // ------- Helpers -------------------

    private static void assertNotEquals(Number n1, Number n2) {
        if (n1.equals(n2)) {
            throw new IllegalStateException(n1 + "==" + n2);
        }
    }

    private static void assertEquals(Number n1, Number n2) {
        if (!n1.equals(n2)) {
            throw new IllegalStateException(n1 + "!=" + n2);
        }
    }

    private static void assertEquals(Object o1, Object o2) {
        if ( !o1.equals(o2)) {
            throw new IllegalStateException(o1 + "!=" + o2);
        }
    }

    private static void assertEquals(boolean b1, boolean b2) {
        if (b1 != b2) {
            throw new IllegalStateException(b1 + "!=" + b2);
        }
    }

    private static void assertNotEquals(boolean b1, boolean b2) {
        if (b1 == b2) {
            throw new IllegalStateException(b1 + "==" + b2);
        }
    }

}
