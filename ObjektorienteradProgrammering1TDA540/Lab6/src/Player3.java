public class Player3 {

    private String name;
    private String oldResult;
    private String newResult;
    private int points;
    private Coin coin;

    public Player3(String name, Coin coin){
        this.name = name;
        this.coin = coin;
    }

    public void flipCoin(){
        oldResult = newResult;
        newResult = coin.flip();
    }
    public String getOldResult(){
        return oldResult;
    }
    public String getNewResult(){
        return newResult;
    }
    public boolean sameAsLast(){
        if(oldResult.equals(newResult)){
            return true;
        }else{
            return false;
        }
    }


    public void addPoint(){
        points++;
    }

    public void reset(){
        oldResult = null;
        newResult = null;
    }
    public int getPoints(){
        return points;
    }
    public String whoplays(){
        return name;
    }
    @Override
    public String toString() {
        return (getClass().getSimpleName() + "{" + "name=" + name +
                ", oldResult=" + oldResult + ", newResult=" + newResult + ", points=" + points +"}");
    }
}
