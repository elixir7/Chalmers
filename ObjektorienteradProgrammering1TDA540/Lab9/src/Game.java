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

    private int cnt = 1;
    private Position monsterPos;
    private Position lastMonsterPos;


    public Game(Enemy enemy, Tower[] towers){
        this.enemy = enemy;
        this.towers = towers;
        //Choose between map1 and map2 to choose map layout.
        this.enemyPath = map1;
        //Finds the highest number according to the game map.
        for(int i = 0; i < enemyPath.length; i++){
            if(enemyPath[i] > endInt){
                endInt = enemyPath[i];
            }
        }
    }


    public void run(){
        for (int i = 0; i < enemyPath.length; i++) {
            if(cnt ==  enemyPath[i]) {
                monsterPos = map[i];
                enemy.setPos(monsterPos);
                shootMonster();
            }else if(cnt - 1 != 0 && cnt - 1 == enemyPath[i]){
                //Check if we are on the last position of the monster
                //Invariance: Makes sure the monsters last position isn't outsid of the map
                lastMonsterPos = map[i];
            }
        }
        cnt++;
    }

    @Override
    public void shootMonster(){
        for(Tower tower : towers){
            for(int k = 0; k < tower.getFireRate(); k++){
                if(tower.canHit(enemy) && tower.didHit()){
                    enemy.decreaseHP(tower.getDamage());
                }
            }
        }
    }

    @Override
    public boolean monsterHasMoved(){
        return lastMonsterPos != null;
    }

    @Override
    public Position getMonsterPos(){
        return monsterPos;
    }

    @Override
    public Position getLastMonsterPos(){
        return lastMonsterPos;
    }

    @Override
    public boolean enemyWon(){
        return cnt > endInt;
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

}
