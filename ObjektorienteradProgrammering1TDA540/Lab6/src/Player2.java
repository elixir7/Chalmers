public class Player2 {

    private String name;
    private DiceCup diceCup;
    private int acumulatedValue = 0;

    public Player2(String name, DiceCup diceCup){
        this.name = name;
        this.diceCup = diceCup;
    }

    public int rollCup(){
        acumulatedValue += diceCup.rollDices();;
        return acumulatedValue;
    }
    public int result(){
        return acumulatedValue;
    }
    @Override
    public String toString(){
        return diceCup.toString();
    }

    public String whoPlays(){
        return name;
    }
}
