public class Enemy {
    private int hitPoints = 15;
    private Position pos;

    //Invariant: Ser till att Monstrets HP aldrig är mindre än noll.
    public void decreaseHP(int damage){
        hitPoints = hitPoints - damage;
        if(hitPoints < 0){
            hitPoints = 0;
        }
    }
    public int getHitPoints(){
        return hitPoints;
    }
    public Position getPos(){
        return pos;
    }
    public void setPos(Position pos){
        this.pos = pos;
    }
    public boolean isDead(){
        return hitPoints <= 0;
    }
}
