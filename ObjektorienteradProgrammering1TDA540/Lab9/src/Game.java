public class Game {
    private Tower[] towers = new Tower[2];
    private Enemy enemy;
    // 6 x 8 Position map
    private Position[] map = new Position[48];
    private Integer[] enemyPath = { 0,0,0,0,0,0,1,0,
                                    0,0,0,0,0,0,1,0,
                                    0,0,1,1,1,0,1,0,
                                    0,0,1,0,1,0,1,0,
                                    1,1,1,0,1,1,1,0,
                                    0,0,0,0,0,0,0,0 };

    public Game(Enemy enemy, Tower[] towers){
        this.enemy = enemy;
        this.towers = towers;
    }

    public Tower[] getTowers(){
        return towers;
    }
    public Enemy getEnemy(){
        return enemy;
    }
    public Integer[] getEnemyPath(){
        return enemyPath;
    }
    public Position[] getMap(){
        return map;
    }
}
