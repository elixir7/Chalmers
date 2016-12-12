

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.GridLayout;
import javax.swing.*;

/**
 * Using LayoutManagers
 *
 * @author hajo
 */
public class Layout extends JFrame {


    public Layout(String title) {
        super(title);
        // Terminate program when window closes
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        // Set top-left window corner on screen center
        setLocationRelativeTo(null);

        this.add(getGridPanel());   // Uncomment to check
        //this.add(getBorderPanel());
        //this.add(getBoxPanel());


        this.setSize(200, 200);
    }

    private JPanel getGridPanel() {
        JPanel p = new JPanel();
        p.setBorder(BorderFactory.createLineBorder(Color.RED));
        p.setLayout(new GridLayout(3, 3, 1, 1)); // Rows, cols, xgap, ygap
        for (int row = 0; row < 3; row++) {
            for (int col = 0; col < 3; col++) {
                JPanel pnl = new JPanel();
                pnl.setBorder(BorderFactory.createTitledBorder(row + ":" + col));
                p.add(pnl);
            }
        }

        return p;
    }

    private JPanel getBorderPanel() {
        JPanel p = new JPanel();
        p.setLayout(new BorderLayout());
        p.add(new JButton("Center"), BorderLayout.CENTER);
        p.add(new JButton("North"), BorderLayout.NORTH);
        p.add(new JButton("East"), BorderLayout.EAST);
        p.add(new JButton("West"), BorderLayout.WEST);
        p.add(new JButton("South"), BorderLayout.SOUTH);
        p.setBorder(BorderFactory.createLineBorder(Color.BLUE));
        return p;
    }
    
    private JPanel getBoxPanel() {
        JPanel p = new JPanel();
        Box b = Box.createVerticalBox(); // b.createHorizontalBox()
        for( int i = 0 ; i < 5 ; i++){
            b.add(new JButton(String.valueOf(i)));
        }
        p.add(b);
        return p;
    }
    
    
    

    public static void main(String[] args) {
        new Layout("Layout").setVisible(true);
    }

}
