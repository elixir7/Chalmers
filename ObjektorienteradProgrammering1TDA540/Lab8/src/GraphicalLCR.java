import javax.swing.*;
import javax.xml.soap.Text;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.Color.*;
import java.util.HashMap;

public class GraphicalLCR extends JFrame {
    private JPanel rootPanel;
    private JButton rollButton;
    private JButton quitButton;
    private JPanel playerPanel;
    private JLabel resultLabel;
    private JPanel cmdPanel;
    private JPanel resultPanel;
    private JTextArea player2TextArea;
    private JTextArea player3TextArea;
    private JTextArea player1TextArea;
    private String[] pNames = {"Isak", "Oskar", "Daniel"};
    private Game lcr;
    private HashMap<Player, JTextArea> map = new HashMap<Player, JTextArea>();
    private JTextArea[] textAreas = new JTextArea[3];

    public static void main(String[] args) {
        new GraphicalLCR();
    }

    public GraphicalLCR() {
        super("LCR game");
        lcr = buildLCRGame(pNames);

        textAreas[0] = player1TextArea;
        textAreas[1] = player2TextArea;
        textAreas[2] = player3TextArea;

        //Puts the playing players as keys and their textAreas as values
        for(int i = 0; i < lcr.getPlayers().length; i++){
            map.put(lcr.getPlayers()[i], textAreas[i]);
        }


        setContentPane(rootPanel);
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);

        //Roll button is pressed
        rollButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                lcr.playTurn();
                render(lcr);
            }
        });

        quitButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                System.exit(0);
            }
        });

        //Renders the intial playernames and values
        for(int i = 0; i < lcr.getPlayers().length; i++){
            map.get(lcr.getPlayers()[i]).setText(lcr.getPlayers()[i].toString());
        }

        setSize(300,400);
        setVisible(true);

        //Runs the normal render to show who the current player is
        render(lcr);

    }

    private Game buildLCRGame(String[] names) {
        Player[] players = new Player[names.length];
        for(int i = 0; i < names.length; i++){
            players[i] = new Player(names[i]);
        }
        Dice dice = new Dice();
        Game newGame = new Game(players, dice);

        return newGame;
    }

    private void render( Game lcr ) {
        //Prints out the result of the rolled dices in the result panel
        String tempStr = "";
        for (String s : lcr.getResult()) {
            tempStr += s + " ";
        }
        resultLabel.setText(tempStr);

        //Resets all the player panel colors
        for(int i = 0; i < textAreas.length; i++){
            textAreas[i].setBackground(Color.WHITE);
        }

        //Prints out the name of the player and how many tiles they have.
        for(int i = 0; i < lcr.getPlayers().length; i++){
            map.get(lcr.getPlayers()[i]).setText(lcr.getPlayers()[i].toString());
        }
        //Make the current players panel green
        map.get(lcr.getActivePlayer()).setBackground(Color.GREEN);

        //Show the winner and disable the roll button if a winner exists
        if(lcr.winnerExists()){
            rollButton.setEnabled(false);
            JOptionPane.showMessageDialog(null, "We have a winner: " + lcr.getWinner().getName());
        }

    }

}
