import java.awt.Color;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.WindowConstants;

/**
 * By inheriting JFrame we get ** A LOT ** of code to use
 *
 * @author hajo
 */
public class MyFrame extends JFrame {


    // In IntelliJ: Mark JFrame > right click > Goto > Declaration
    // (continue in same way up to Object, How many rows of code ...?
    public static void main(String[] args) {
        MyFrame myFrame = new MyFrame();
        myFrame.setTitle("Mycket kod ärver jag...");  // Use inherited method
        myFrame.setSize(200, 200);
        myFrame.setVisible(true);
        // Note: program will not finish when window closed
        // (click red square to stop)
    }

}
