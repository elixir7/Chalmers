package typesystem;

import java.util.List;
import java.util.Random;

/**
 * A bag to pick tiles from
 *
 * @author hajo
 */

public class TileBag {

    // Use a list to make bag shrimp, exactly what we want.
    private final List<Tile> tiles;
    private final Random r = new Random();

    public TileBag(List<Tile> tiles) {
        this.tiles = tiles;
    }

    public Tile remove() {
        if (tiles.size() > 0) {
            int i = r.nextInt(tiles.size());
            return tiles.remove(i);
        } else {
            return null;
        }
    }

    public void add(Tile t) {
       tiles.add(t);
    }

    public boolean isEmpty() {
        return tiles.isEmpty();
    }

}
