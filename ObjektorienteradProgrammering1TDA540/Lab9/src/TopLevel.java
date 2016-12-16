public interface TopLevel {

    boolean enemyWon();
    boolean monsterHasMoved();
    void shootMonster();

    Position getMonsterPos();
    Position getLastMonsterPos();
    Tower[] getTowers();
    Enemy getEnemy();
    Integer[] getEnemyPath();
    Position[] getMap();

}
