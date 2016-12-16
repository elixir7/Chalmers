public class Game implements TopLevel{
    //Each game contains 2 towers
    private Tower[] towers = new Tower[2];
    private Enemy enemy;
    // 6 x 8 Position map
    private Position[] map = new Position[48];
    private Integer[] map1 =  { 0,0,0,0,0,0 ,15,0,
                                0,0,0,0,0,0 ,14,0,
                                0,0,5,6,7,0 ,13,0,
                                0,0,4,0,8,0 ,12,0,
                                1,2,3,0,9,10,11,0,
                                0,0,0,0,0,0,0,0 };

    private Integer[] map2 =  { 0,0,0,1,0,0,0,0,
                                0,0,0,2,0,0,0,0,
                                0,0,0,3,0,0,0,0,
                                0,0,0,4,0,0,0,0,
                                8,7,6,5,0,0,0,0,
                                0,0,0,0,0,0,0,0 };
    private Integer[] enemyPath;

    //The last number on the map, used to determine if the monster has won.
    private int endInt;


    public Game(Enemy enemy, Tower[] towers){
        this.enemy = enemy;
        this.towers = towers;
        this.enemyPath = map1;
        //Finds the highest number according to the game map.
        for(int i = 0; i < this.enemyPath.length; i++){
            if(this.enemyPath[i] > this.getEndInt()){
                this.endInt = this.enemyPath[i];
            }
        }
    }


    public void run(){

    }


    @Override
    public Tower[] getTowers(){
        return towers;
    }

    @Override
    public Enemy getEnemy(){
        return enemy;
    }

    @Override
    public Integer[] getEnemyPath(){
        return enemyPath;
    }

    @Override
    public Position[] getMap(){
        return map;
    }

    @Override
    public int getEndInt(){
        return endInt;
    }
}
