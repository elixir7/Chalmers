

import java.awt.GridLayout;
import javax.swing.*;

/**
 *  Compare setSize() vs pack()
 * @author hajo
 */
public class SetSizeVsPack extends JFrame {

   private JButton start = new JButton("Start");
    private JButton stop = new JButton("Stop");

    public SetSizeVsPack(String title) {
        super(title);
        // Terminate program when window closes
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        // Set top-left window corner on screen center
        setLocationRelativeTo(null);
        this.add(getButtonPanel());

        this.setSize(200, 200);               // Compare !!!!
        //this.pack();

    }

    public JPanel getButtonPanel() {
        JPanel p = new JPanel();
        p.add(start);
        p.add(stop);
        return p;
    }
      
     // Just to start. Swing program always started like this
     public static void main(String args[]) {
        new SetSizeVsPack("SetSize vs Pack").setVisible(true);
    }  
   
}
