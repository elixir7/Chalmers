package init;

/**
 * @author hajo
 */
public class SubSub extends Sub {

    public SubSub() {
        System.out.println("Doing SubSub contructor");
    }

    public SubSub(int i) {
        super(i);
        System.out.println("Doing SubSub contructor i=" + i);
    }

}
