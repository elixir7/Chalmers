import javax.swing.*;
import javax.swing.border.BevelBorder;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 * Basic event handling
 *
 * @author hajo
 */
// This class is a listener implements ActionListener
public class EventHandling extends JFrame implements ActionListener {

    private JButton start = new JButton("Start");
    private JButton stop = new JButton("Stop");

    public EventHandling(String title) {
        super(title);
        // Terminate program when window closes
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        // Set top-left window corner on screen center
        setLocationRelativeTo(null);
        this.add(getButtonPanel());
        this.setSize(200, 200);

    }

    public JPanel getButtonPanel() {
        JPanel p = new JPanel();
        start.addActionListener(this);  // Connect button ato listener
        stop.addActionListener(this);
        p.add(start);
        p.add(stop);
        return p;
    }

    // Listener method
    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == start) {
            JOptionPane.showMessageDialog(this, "Start");
        } else if (e.getSource() == stop) {
            JOptionPane.showMessageDialog(this, "Stop");
        } else {
            JOptionPane.showMessageDialog(this, "???");
        }
    }

    public static void main(String[] args) {
        new EventHandling("EventHandling").setVisible(true);
    }

}
