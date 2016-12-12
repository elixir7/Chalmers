package typesystem;

/**
 * Show that all reference types are type compatible with Object. Also explicit
 * type casting (is dangerous) but need in between
 *
 *
 * @author hajo
 */
public class TestTypeSystemAndInheritance {

    public static void main(String args[]) {
        Tile t1 = new Tile("A", 1);
        Tile t2;

        Object o1 = t1; // Ok Tile subtype to Object 
        t2 = t1; // Ok, same type (also any type is subtype to itself)

        //t2 = new Object();  // No incompatible

        // Can only use "Object-part" 
        boolean b = o1.equals(t2);  // Ok!
        //o1.getGlypth();   // No, no such method in Object

        /*
         * Explicit casting
         */
        Tile t3 = (Tile) o1; // Will work because we know, type checker will not check
        //TileBag tb2 = (TileBag) o1;  // Exception !!!

        //Tile t4 = (Tile) o2;  // Oh, oh, runtime class cast exception

        ((Tile) o1).getGlypth(); // Ok explicit casting

    }
}
