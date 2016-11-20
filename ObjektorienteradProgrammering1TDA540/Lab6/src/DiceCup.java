public class DiceCup {
    private Dice[] dices;

    public DiceCup(Dice[] dices){
        this.dices = dices;
    }

    public int rollDices(){
        int sum = 0;
        for(int i = 0; i < dices.length; i++){
            sum += dices[i].roll();
        }
        return sum;

    }

    @Override
    public String toString() {
        String output = "";
        for(int i = 0; i < dices.length; i++){
            output +=  dices[i].toString() + ", ";
        }
        return getClass().getSimpleName() + "[dices=[" + output + "]]";
    }
}
