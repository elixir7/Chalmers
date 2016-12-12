public class Enemy {
    private int HP = 10;
    private String iconPath = "icons/monster10.gif";

    public void decreaseHP(int damage){
        HP = HP - damage;
    }
    public int getHP(){
        return HP;
    }
    public String getIconPath(){
        return iconPath;
    }

    public boolean isDead(){
        if(HP > 0){
            return false;
        }else{
            return true;
        }
    }
}
