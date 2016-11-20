import java.util.Scanner;
import java.util.Random;

public class Lab6_skel {

    public static void main(String[] args) {
        //rollADice();
        //rollADiceButNot();
        //letPlayerRoll();
        //letTwoPlayersRollSameDice();
        //letPlayerUseDiceCup();
        //findPlayerWithMax();
        coinFlipGame();
    }

    // ---------  1  ------------------------

    public static void rollADice() {
        Dice dice = new Dice();
        for(int i = 0; i < 100; i++){
            System.out.print(dice.roll() + ", ");
        }
    }

    // --------- 2 -------------------

    public static void rollADiceButNot() {
        int sides = 6;
        Dice dice = new Dice(sides);
        for(int i = 0; i < 60; i++){
            Random rand = new Random();
            int number = rand.nextInt(sides) + 1;
            System.out.print(dice.rollWithout(number) + ", ");
        }
    }

    // --------- 3 -----------------

    public static void letPlayerRoll() {
        Dice dice = new Dice(6);
        Player1 player1 = new Player1("Isak", dice);

        System.out.println(player1.whoPlays());

        for(int i = 0; i < 5; i++){
            System.out.print(player1.roll() + " ");
        }
    }

    // ------------ 4 ---------------

    public static void letTwoPlayersRollSameDice() {
        Dice dice = new Dice(6);
        Player1 player1 = new Player1("Isak", dice);
        Player1 player2 = new Player1("Oskar", dice);

        System.out.println(player1.whoPlays());

        for(int i = 0; i < 5; i++){
            System.out.print(player1.roll() + " ");
        }

        System.out.println("\n\n" + player2.whoPlays());
        for(int i = 0; i < 5; i++){
            System.out.print(player2.roll() + " ");
        }
    }

    // --------- 5 --------------

    public static void letPlayerUseDiceCup() {
        Dice[] dices = new Dice[5];
        for(int i = 0; i < 5; i++){
            dices[i] = new Dice(6);
        }
        DiceCup diceCup = new DiceCup(dices);

        Player2 player2 = new Player2("Arne", diceCup);

        for(int k = 0; k < 2; k++){
            System.out.println(player2.whoPlays() + " " + player2.rollCup());
            System.out.println(player2.toString());
        }

    }

    // ---------  6 ---------------
    // Same as above but toString overridden.


    // ---------- 7 ---------------

    public static void findPlayerWithMax() {
        Dice[] dices = new Dice[5];
        for(int i = 0; i < 5; i++){
            dices[i] = new Dice();
        }

        DiceCup diceCup = new DiceCup(dices);
        Player2[] players = new Player2[5];

        for(int i = 0; i < players.length; i++){
            players[i] = new Player2(Integer.toString(i), diceCup);
            System.out.println(players[i].whoPlays() + ":" + players[i].rollCup());
            System.out.println(players[i].toString());
        }

        //Checks who is the winner
        //If more than one player are tied for the highest points, the first player who has that many points wins.
        Player2 winner = players[0];
        for(int i = 1; i < players.length; i++){
            if(players[i].result() > winner.result()){
                winner = players[i];
            }
        }
        System.out.print("Max " + winner.whoPlays() + ":" + winner.result());
    }


    // ------------ 8 ---------------
    public static void coinFlipGame() {
        Coin coin = new Coin();
        Player3 olle = new Player3("Olle", coin);
        Player3 lisa = new Player3("Lisa", coin);
        Player3 currentPlayer = olle;

        Scanner sc = new Scanner(System.in);
        System.out.println("Welcome to the coin flipping game! \nGive command f, p or q to give input. " +
                "\nf = flip \np = pass \nq = exit ");
        System.out.println("Starting Player: " + currentPlayer.whoplays());

        boolean finished = false;
        while(!finished){
            switch(sc.nextLine()){
                case "f":
                    if(currentPlayer.getNewResult() == null){
                        currentPlayer.flipCoin();
                    }else if(currentPlayer.getOldResult() == null){
                        currentPlayer.flipCoin();
                        if(currentPlayer.sameAsLast()){
                            currentPlayer.addPoint();
                        }
                    }else if(currentPlayer.sameAsLast()){
                        currentPlayer.flipCoin();
                        if(currentPlayer.sameAsLast()){
                            currentPlayer.addPoint();
                        }
                    }else{
                        System.out.println("You may not flip, pass over coin!");
                    }
                    System.out.println(currentPlayer.toString());
                    break;
                case "p":
                    if(currentPlayer.whoplays().equals("Olle")){
                        currentPlayer = lisa;
                        lisa.reset();
                    }else{
                        currentPlayer = olle;
                        olle.reset();
                    }
                    System.out.println("New Player: " + currentPlayer.whoplays());
                    break;
                case "q":
                    if(olle.getPoints() > lisa.getPoints()){
                        System.out.println("Olle är vinnaren!");
                    }else{
                        System.out.println("Lisa är vinnaren!");
                    }
                    finished = true;
                    break;
                default:
                    System.out.println("Invalid Input");
                    break;
            }

        }
    }

}



