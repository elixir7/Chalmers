public class Player {
    private String name;
    private int tiles = 3;
    private Character lastRoll;
    private int id;
    //Static is very important here because each has to have an unique ID.
    private static int idGen = 0;

    //The constructor makes a unique id for each player.
    public Player(String name){
        this.name = name;
        id = idGen;
        idGen++;
    }

    public void rollDice(Dice dice){
        dice.roll();
        lastRoll = dice.getLastRoll();
    }

    public Character getLastRoll(){
        return lastRoll;
    }

    public String getName(){
        return name;
    }

    public void addTile(){
        tiles++;
    }

    public void removeTile(){
        tiles--;
    }

    public boolean hasTiles(){
        if(tiles > 0){
            return true;
        }else{
            return false;
        }
    }

    public int getId(){
        return id;
    }

    public int getNRolls(){
        if(tiles > 3){
            return 3;
        }else{
            return tiles;
        }
    }

    @Override
    public String toString(){
        return "{" + name + ", " + tiles + "}";
    }

}
