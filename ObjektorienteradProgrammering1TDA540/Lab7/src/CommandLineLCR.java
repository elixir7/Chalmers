import java.util.Scanner;

public class CommandLineLCR {

    public static void main(String[] args) {
        CommandLineLCR game = new CommandLineLCR();
        game.run();
    }

    public void run(){
        boolean done = false;
        Scanner s = new Scanner(System.in);

        System.out.println("Welcome to the LCR Game!");
        System.out.println("How many players?");

        String cmd = s.nextLine();

        //Find out how many players there are and what their names are.
        int numberOfPlayers = Integer.parseInt(cmd);
        String[] playerNames = new String[numberOfPlayers];
        for(int i = 0; i < numberOfPlayers; i++){
            System.out.println("Player " + Integer.toString(i + 1) + "'s name?");
            cmd = s.nextLine();
            playerNames[i] = cmd;
        }

        //Build the game by supplying all the player names
        Game lcr = buildLCRGame(playerNames);

        System.out.println("Players are: ");
        render(lcr);

        while (!done) {
            System.out.println("Player is " + lcr.getActivePlayerName());

            System.out.print("> ");
            cmd = s.nextLine();
            switch (cmd) {
                case "r":
                    lcr.playTurn();
                    if(lcr.winnerExists()){
                        done = true;
                        s.close();
                    }
                    break;
                case "q":
                    done = true;
                    break;
                default:
                    System.out.println("Invalid input!");
            }
            render(lcr);
        }

        if (lcr.winnerExists()) {
            System.out.println("Game over! Winner is " + lcr.getWinner().getName());
        } else {
            render(lcr);
            System.out.println("Game aborted");
        }
    }

    private static Game buildLCRGame(String[] names) {
        Player[] players = new Player[names.length];
        for(int i = 0; i < names.length; i++){
            players[i] = new Player(names[i]);
        }
        Dice dice = new Dice();
        Game newGame = new Game(players, dice);
        return newGame;
    }


    private void render( Game lcr ) {
        //Prints out the result of the rolled dices as a String array
        for (String s : lcr.getResult()) {
            System.out.print(s + "  ");
        }
        System.out.println();

        //Prints out the name of the player and how many tiles they have.
        for (Player player : lcr.getPlayers()) {
            System.out.print(player.toString() + " ");
        }
        System.out.println();
    }

}
