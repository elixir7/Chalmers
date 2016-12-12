/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package init;

/**
 * Check how constructors are called, watch output
 * @author hajo
 */
public class TestInitializationInheritance {
    
    public static void main(String args[]) {
        
        SubSub b = new SubSub();
        
        SubSub s = new SubSub(99);
        
        System.out.println("b.i = " + b.getI() + " s.i = " + s.getI());
        
    }
    
}
