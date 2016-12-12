package typesystem;

import java.util.Objects;

/**
 * Tile for Scrabble This is an immutable class. Can't change attributes
 *
 * @author hajo
 *
 */
public class Tile {

    // Ths special glypths, possible need to check elsewhere, make public
    // Better with enum
    public static final String BLANK = " "; 
    public static final String BLACK = "black";
    public static final String ARROW_RIGHT = "right";
    public static final String ARROW_DOWN = "down";
    /* 
     * This could be blank i.e. used as any letter or..
     * A black tile (null tile) 
     */
    private final String glypth;
    private final int points;

    public Tile(String glypth, int points) {
        this.glypth = glypth;
        this.points = points;
    }

    public Tile(String glypth) {
        this(glypth, 0);
    }

    public String getGlypth() {
        return glypth;
    }

    public int getPoints() {
        return points;
    }

    @Override  // More on this later
    public String toString() {
        return glypth;
    }

    // Don't need to understand, used in Map's (collections)
    @Override
    public int hashCode() {
        int hash = 5;
        hash = 97 * hash + Objects.hashCode(this.glypth);
        hash = 97 * hash + this.points;
        return hash;
    }

    // If class stored in collection should have own equals method
    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Tile other = (Tile) obj;
        return this.glypth.equals(other.glypth) && 
                this.points == other.points;
    }
    
    
}
