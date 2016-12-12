package typesystem;

/**
 * Created by hajo on 11/17/14.
 */
public class TestRuntimeType {


    public static void main(String args[]) {
        Object o = new Tile("A", 1);  // Assign sub to super type

        // Will print the runtime type
        System.out.println(o.getClass());


    }
}
