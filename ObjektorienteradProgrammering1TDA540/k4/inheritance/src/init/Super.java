package init;

/**
 * Very common to call top level superclass for Base
 * (or similar)
 *
 * @author hajo
 */
public class Super {

    private int i;

    public Super() {
        System.out.println("Doing Base contructor");
    }

    public Super(int i) {
        this.i = i;
        System.out.println("Doing Base contructor i=" + i);
    }

    // Inherited in all subclasses
    public int getI() {
        return i;
    }
}
