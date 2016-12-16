import com.sun.tools.doclets.formats.html.SourceToHTMLConverter;

import javax.swing.*;
import javax.swing.Timer;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.net.URL;
import java.util.*;

/*

    Gör funktion typ "checkGameStatus()" för att de är nice med metoder i actionPerformed
    Dela upp getLandscapePanel i mer metoder för att lättare se!

 */
public class GUITowerDefence extends JFrame implements ActionListener {

    private final Map<Position, JPanel> positionsPanels = new HashMap<>();
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
        this.setSize(900, 700);

        timer = new Timer(SPEED, this);
        timer.setInitialDelay(PAUSE);
        timer.start();
    }

    //Invarians: Ser till att spelet inte körs om monstret är död eller påväg att gå utanför mapen
    //Runs all rendering and updating the GUI after each tick in the timer
    @Override
    public void actionPerformed(ActionEvent e) {
        game.run();

        setMonsterPanel(positionsPanels.get(game.getMonsterPos()));
        if(game.monsterHasMoved()){
            setDefaultPanel(positionsPanels.get(game.getLastMonsterPos()));
        }

        revalidate();
        repaint();

        if(game.getEnemy().isDead()){
            timer.stop();
            JOptionPane.showMessageDialog(null, "You won!");
            this.dispose();
            this.setVisible(false);
        }else if(game.enemyWon()) {
            timer.stop();
            JOptionPane.showMessageDialog(null, "Enemy won!");
            this.dispose();
            this.setVisible(false);
        }
    }


    //Builds top level object
    private Game buildTowerDefence() {
        //Tower 1 and 2 is suppose to be used with Map1 (in Game.java)
        //Tower 3 and 4 is suppose to be used with Map2 (in Game.java)
        Tower tower1 = new Tower(new Position(3, 3));
        Tower tower2 = new Tower(new Position(5, 3));
        Tower[] towers1 = {tower1, tower2};
        //Tower tower3 = new Tower(new Position(2, 1));
        //Tower tower4 = new Tower(new Position(2, 3));
        //Tower[] towers2 = {tower3, tower4};
        Enemy enemy = new Enemy();
        return new Game(enemy, towers1);
    }

    //Returns the initial renderd panel
    private JPanel getLandscapePanel() {
        JPanel mainPanel = new JPanel(new BorderLayout());
        mainPanel.setLayout(new GridLayout(6, 8));

        int counter = 0;
        //Loops Y-way
        for(int i = 0; i < 6; i++){
            //Loops X-way
            for(int k = 0; k < 8; k++){
                //Set x,y value of each position object in the map array
                game.getMap()[counter] = new Position(k, i);

                JPanel tempPanel = new JPanel();
                JLabel tempLabel = new JLabel();
                tempLabel.setLayout(new BorderLayout());
                tempPanel.setBorder(BorderFactory.createLineBorder(Color.black));
                tempPanel.setOpaque(true);

                //If the panel isn't the enemy path, make it green
                if(game.getEnemyPath()[counter] == 0){
                    tempPanel.setBackground(Color.GREEN);
                }
                // Loop through towers and position them on the main panel.
                for(int u = 0; u < game.getTowers().length; u++){
                    Position tempMapPos = game.getMap()[counter];
                    Position tempTowerPos = game.getTowers()[u].getPosition();

                    if( tempMapPos.getX() == tempTowerPos.getX() && tempMapPos.getY() == tempTowerPos.getY() ){
                        tempLabel = getIconLabel(game.getTowers()[u].getIconPath());
                    }
                }
                tempPanel.add(tempLabel);
                mainPanel.add(tempPanel);

                //Connect Panels with a position in the Map
                positionsPanels.put(game.getMap()[counter], tempPanel);
                counter++;
            }
        }
        return mainPanel;
    }

    // Given a file name returns a JLabel with an icon
    private JLabel getIconLabel(String fileName) {
        URL url = this.getClass().getResource(fileName);
        ImageIcon ii = new ImageIcon(url);
        JLabel lbl = new JLabel(ii);
        return lbl;
    }

    //Transforms a panel to a Monster Panel
    private void setMonsterPanel(JPanel norPanel){
        JLabel health = new JLabel(Integer.toString(game.getEnemy().getHitPoints()));
        JLabel icon = getIconLabel(game.getEnemy().getIconPath());
        norPanel.add(icon, BorderLayout.NORTH);
        norPanel.add(health, BorderLayout.SOUTH);
    }

    //Transforms a panel to a plain panel
    private void setDefaultPanel(JPanel panel){
        panel.removeAll();
    }
}
