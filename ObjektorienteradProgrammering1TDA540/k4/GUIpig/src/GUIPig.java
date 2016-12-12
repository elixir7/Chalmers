import javax.swing.*;
import javax.swing.border.LineBorder;
import javax.swing.border.TitledBorder;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by hajo on 9/18/14.
 */
public class GUIPig extends JFrame implements ActionListener {


    private final JTextArea results = new JTextArea(4, 4);
    private final JButton roll = new JButton("Roll");
    private final JButton next = new JButton("Next");
    private final JLabel total = new JLabel("0");
    // Keep track of each Players Panel
    private final Map<Player, PlayerPanel> playersPanels = new HashMap<>();
    private IPig pig;


    public GUIPig(IPig pig, String title) throws HeadlessException {
        super(title);
        super.setLayout(new BorderLayout());
        super.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        // Order matters
        this.pig = pig;
        this.setLocationRelativeTo(null);
        this.add(getPlayersPanel(), BorderLayout.NORTH);
        this.add(getResultPanel(), BorderLayout.CENTER);
        this.add(getButtonPanel(), BorderLayout.SOUTH);
        this.setPlayerPanelBackground();
        this.next.setEnabled(false);
        this.setSize(300, 300);

    }

    // ------------ The real action is here -----------

    private void doRoll() {
        next.setEnabled(true);
        int result = pig.roll();
        if (result == 1) {
            roll.setEnabled(false);
            total.setText("0");
        } else {
            int t = Integer.parseInt(total.getText()) + result;
            total.setText(String.valueOf(t));
        }
        results.append(String.valueOf(result + "\n"));
    }

    private void doNext() {
        pig.setTotal();
        setPlayerPanelTotal();
        if (pig.gameOver()) {
            JOptionPane.showMessageDialog(this, "Winner is " + pig.getActualPlayer());
            roll.setEnabled(false);
            next.setEnabled(false);
        }else {
            pig.next();
            setPlayerPanelBackground();
            roll.setEnabled(true);
            results.setText("");
            total.setText("0");
            next.setEnabled(false);
        }

    }

    // ------- The listener method -------------

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == roll) {
            doRoll();
        } else if (e.getSource() == next) {
            doNext();
        }
    }

    // -------- Start program -------------------

    public static void main(String[] args) {
        IPig pig = buildPig();
        new GUIPig(pig, "PIG").setVisible(true);
    }

    // ------  Build program -----------

    private static IPig buildPig() {
        PigDice dice = new PigDice(6);
        List<Player> players = new ArrayList<>();
        players.add(new Player("Anna", dice));
        players.add(new Player("Urban", dice));
        players.add(new Player("Fia", dice));

        return new Pig(players, dice, 20);
    }

    // ---------- Privates -----------------

    private void reset() {
        for (PlayerPanel pp : playersPanels.values()) {
            pp.setTotal(0);
        }
        pig = buildPig();
        setPlayerPanelBackground();
    }

    private void setPlayerPanelBackground() {
        for (Player p : playersPanels.keySet()) {
            if (p == pig.getActualPlayer()) {
                playersPanels.get(p).setBackground(Color.YELLOW);
            } else {
                playersPanels.get(p).setBackground(Color.LIGHT_GRAY);
            }
        }
    }

    private void setPlayerPanelTotal() {
        PlayerPanel p = playersPanels.get(pig.getActualPlayer());
        p.setTotal(pig.getActualPlayer().getTotal());
    }

    // ---------- Create GUI --------------------

    private JPanel getPlayersPanel() {
        JPanel p = new JPanel();
        p.setBorder(new TitledBorder("Players"));
        for (Player player : pig.getPlayers()) {
            p.add(getPlayerPanel(player));
        }
        return p;
    }

    private JPanel getPlayerPanel(Player player) {
        PlayerPanel p = new PlayerPanel(player); // Type compatible!!
        playersPanels.put(player, p); // Save in map for quick lookup
        return p;
    }

    private JPanel getButtonPanel() {
        JPanel p = new JPanel();
        p.setBorder(new TitledBorder("Commands"));
        roll.addActionListener(this);
        next.addActionListener(this);
        p.add(roll);
        p.add(next);
        return p;
    }

    private JPanel getResultPanel() {
        JPanel p = new JPanel();
        p.setLayout(new BorderLayout());
        p.setBorder(new TitledBorder("Result"));
        results.setBorder(new LineBorder(Color.BLACK));
        results.setEditable(false);
        JScrollPane sp = new JScrollPane(results);
        sp.createVerticalScrollBar();

        p.add(sp, BorderLayout.CENTER);
        total.setPreferredSize(new Dimension(30, 200));
        p.add(total, BorderLayout.EAST);
        return p;
    }


    // ------------ Inner class----------------------------

    public class PlayerPanel extends JPanel {

        JLabel name = new JLabel();
        JLabel playerTotal = new JLabel("0");

        public PlayerPanel(Player player) {
            this.setBorder(new LineBorder(Color.BLACK));
            name.setText(player.getName());
            playerTotal.setText(String.valueOf(player.getTotal()));
            this.add(name);
            this.add(playerTotal);
        }

        public void setTotal(int i) {
            playerTotal.setText(String.valueOf(i));
        }
    }
}
