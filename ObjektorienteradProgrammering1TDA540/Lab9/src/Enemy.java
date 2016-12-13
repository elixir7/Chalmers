public class Enemy {
    private int HP = 15;
    private String iconPath = "icons/monster10.gif";
    private Position pos;

    //Invariant: Ser till att Monstrets HP aldrig är mindre än noll.
    public void decreaseHP(int damage){
        HP = HP - damage;
        if(HP < 0){
            HP = 0;
        }
    }
    public int getHP(){
        return HP;
    }
    public String getIconPath(){
        return iconPath;
    }
    public Position getPos(){
        return pos;
    }
    public void setPos(Position pos){
        this.pos = pos;
    }
    public boolean isDead(){
        return HP <= 0;
    }
}
