

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.*;
import javax.swing.border.BevelBorder;

/**
 * Basic usage of a few components
 *
 * @author hajo
 */
// This class is a listener implements ActionListener
public class SomeComponents extends JFrame implements ActionListener {

    private JButton button = new JButton("Copy");
    private JButton disable = new JButton("Disable");
    private JTextField in = new JTextField();
    private JTextField out = new JTextField();
    private JLabel inLbl = new JLabel("In");
    private JLabel outLbl = new JLabel("Out");

    public SomeComponents(String title) {
        super(title);
        // Terminate program when window closes
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        // Set top-left window corner on screen center
        setLocationRelativeTo(null);
        this.setLayout(new BorderLayout());
        this.add(getComponentPanel(), BorderLayout.CENTER);
        this.add(getButtonPanel(), BorderLayout.SOUTH);
        this.pack();

    }

    // Listener method
    @Override
    public void actionPerformed(ActionEvent e) {
        if( e.getSource() == button){
            String s = in.getText();
            in.setText("");
            out.setText(s);
        }else if( e.getSource() == disable){
            if( button.isEnabled()) {
                button.setEnabled(false);
            }else {
                button.setEnabled(true);
            }
        }

    }

    private JPanel getComponentPanel() {
        JPanel p = new JPanel();
        p.setBorder(BorderFactory.createTitledBorder("Inout"));
        p.setLayout(new GridLayout(3, 3, 1, 1)); // Rows, cols, xgap, ygap
        p.add(inLbl);
        in.setColumns(10);
        p.add(in);
        p.add(outLbl);
        out.setColumns(10);
        p.add(out);
        return p;

    }

    private JPanel getButtonPanel() {
        JPanel p = new JPanel();
        button.addActionListener(this);
        disable.addActionListener(this);
        p.add(button);
        p.add(disable);
        return p;
    }

    public static void main(String[] args) {
        new SomeComponents("Some Components").setVisible(true);
    }


}
