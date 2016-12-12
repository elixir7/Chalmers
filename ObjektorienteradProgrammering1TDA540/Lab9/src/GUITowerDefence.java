import com.sun.tools.doclets.formats.html.SourceToHTMLConverter;

import javax.swing.*;
import javax.swing.Timer;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.net.URL;
import java.util.*;
import java.util.List;

public class GUITowerDefence extends JFrame implements ActionListener {

    private final Map<Position, JLabel> positionsPanels = new HashMap<>();
    private final MonsterPanel monsterPanel = new MonsterPanel();
    private final Timer timer;
    private static final int SPEED = 1000;
    private static final int PAUSE = 1000;
    private Game game;


    public static void main(String[] args) {
        new GUITowerDefence("Tower Defence").setVisible(true);
    }

    public GUITowerDefence(String title) {
        super(title);
        game = buildTowerDefence();
        this.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        this.setLayout(new BorderLayout());
        this.setResizable(false);
        this.add(getLandscapePanel(), BorderLayout.CENTER);
        this.setSize(600, 450);

        timer = new Timer(SPEED, this);
        timer.setInitialDelay(PAUSE);
        // Will generate ActionEvents
        timer.start();
    }

    // ---------- Event handling --------------------

    @Override
    public void actionPerformed(ActionEvent e) {


    }

    // ---------- Render (if actionPerformed to large) ---------------


    // ---------- Build model ----------
    private Game buildTowerDefence() {
        Tower tower1 = new Tower(new Position(3, 3));
        Tower tower2 = new Tower(new Position(5, 3));
        Tower[] towers = {tower1, tower2};
        Enemy enemy = new Enemy();
        return new Game(enemy, towers);
    }


    // ----------- Build GUI ---------------------

    private JPanel getLandscapePanel() {
        //Return a Panel with many panels
        JPanel mainPanel = new JPanel(new BorderLayout());
        mainPanel.setLayout(new GridLayout(6, 8));

        int counter = 0;
        //Loops Y-way
        for(int i = 0; i < 6; i++){
            //Loops X-way
            for(int k = 0; k < 8; k++){
                //Set x,y value of each position object in the map array
                game.getMap()[counter] = new Position(k, i);

                JLabel tempLabel = new JLabel();
                tempLabel.setBorder(BorderFactory.createLineBorder(Color.black));
                tempLabel.setOpaque(true);

                for(int u = 0; u < game.getTowers().length; u++){
                    Position tempMapPos = game.getMap()[counter];
                    Position tempTowerPos = game.getTowers()[u].getPosition();

                    if( tempMapPos.getX() == tempTowerPos.getX() && tempMapPos.getY() == tempTowerPos.getY() ){
                        tempLabel = getIconLabel(game.getTowers()[u].getIconPath());
                        tempLabel.setBorder(BorderFactory.createLineBorder(Color.black));
                    }
                }
                if(game.getEnemyPath()[counter] != 1){
                    //Tornen blir inte gröna eftersom iconen är över.
                    tempLabel.setBackground(Color.GREEN);
                }
                mainPanel.add(tempLabel);

                //Connect Labels with a position in the Map
                positionsPanels.put(game.getMap()[counter], tempLabel);
                counter++;
            }
        }

        return mainPanel;
    }

    // Given a file name returns a label with an icon
    private JLabel getIconLabel(String fileName) {
        URL url = this.getClass().getResource(fileName);
        ImageIcon ii = new ImageIcon(url);
        JLabel lbl = new JLabel(ii);
        return lbl;
    }


    // -------------- Inner class ------------------
    // Use if you like
    private class MonsterPanel extends JPanel {

        private JLabel monster;
        private JLabel health = new JLabel();

        public MonsterPanel() {
            this.setBackground(Color.WHITE);
            this.setLayout(new BorderLayout());
            this.monster = getIconLabel("icons/monster10.gif");
            health.setFont(new Font("Serif", Font.BOLD, 10));
            this.add(monster, BorderLayout.CENTER);
            this.add(health, BorderLayout.SOUTH);
        }

        public void setHealth(int health) {
            this.health.setText(String.valueOf(health));
        }
    }

}
