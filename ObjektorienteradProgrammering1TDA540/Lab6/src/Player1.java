public class Player1 {
    private String name;
    private Dice dice;

    public Player1(String name, Dice dice){
        this.name = name;
        this.dice = dice;
    }

    public int roll(){
        return dice.roll();
    }

    public String whoPlays(){
        return "The player is " + name;
    }

}
