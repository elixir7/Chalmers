public interface TopLevel {

    void run();
    void shootMonster();

    boolean enemyWon();
    boolean monsterHasMoved();

    Position getMonsterPos();
    Position getLastMonsterPos();
    Tower[] getTowers();
    Enemy getEnemy();
    Integer[] getEnemyPath();
    Position[] getMap();

}
