import java.util.*;

public class Game {
    private Player[] players;
    private Dice dice;
    private Player winner;
    private Player activePlayer;
    private String[] diceResults = {"", "", ""};
    private ArrayList<Player> winningPlayerList;

    public Game(Player[] players, Dice dice){
        this.players = players;
        this.dice = dice;
        activePlayer = players[0];
    }

    //Plays the activePlayers turn
    public void playTurn(){
        int rolls = activePlayer.getNRolls();
        //Fills the diceResult array with empty spots
        for(int i = 0; i < diceResults.length; i++){
            diceResults[i] = "";
        }
        for(int i = 0; i < rolls; i++){
            activePlayer.rollDice(dice);
            switch(activePlayer.getLastRoll()){
                case 'L':
                    //The dice result is "L", give one tile to the left player
                    activePlayer.removeTile();
                    getPlayerLeft().addTile();
                    diceResults[i] = "L";
                    break;
                case 'R':
                    //The dice result is "R", give one tile to the right player
                    activePlayer.removeTile();
                    getPlayerRight().addTile();
                    diceResults[i] = "R";
                    break;
                case 'C':
                    //The dice result is "C", remove a tile from the active player
                    activePlayer.removeTile();
                    diceResults[i] = "C";
                    break;
                case '.':
                    diceResults[i] = ".";
                    break;

            }
        }
        //Pass the turn to the left player
        activePlayer = getPlayerLeft();
    }

    //Checks if only one player has tiles
    public boolean winnerExists(){
         winningPlayerList = new ArrayList<>();
        //Adds a player to the winningPlayerList if he/her has tiles
        for(Player player : players){
            if(player.hasTiles()){
                winningPlayerList.add(player);
            }
        }
        if(winningPlayerList.size() == 1){
            //The Arraylist only has 1 spot which means only 1 player has tiles = we have a winner
            winner = winningPlayerList.get(0);
            return true;
        }else{
            return false;
        }
    }

    //Returns the winning player
    public Player getWinner(){
        return winner;
    }

    public Player[] getPlayers(){
        return players;
    }

    public String getActivePlayerName(){
        return activePlayer.getName();
    }

    public String[] getResult(){
        return diceResults;
    }

    public Player getPlayerRight(){
        if(activePlayer.getId() == players.length - 1){
            return players[0];
        }else{
            return players[activePlayer.getId() + 1];
        }
    }

    public Player getPlayerLeft(){
        if(activePlayer.getId() == 0){
            return players[players.length - 1];
        }else{
            return players[activePlayer.getId() - 1];
        }
    }


}
