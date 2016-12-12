package init;

/**
 * @author hajo
 */
public class Sub extends Super {
    public Sub() {
        System.out.println("Doing Sub contructor");
    }

    public Sub(int i) {
        super(i);
        System.out.println("Doing Sub contructor i= " + i);
    }
}
