import java.util.Random;

public class Tower {
    private int fireRate = 2;
    private int range = 1;
    private int damage = 1;
    private String iconPath = "icons/tower-icon.png";
    private Random rand = new Random();
    private Position pos;

    public Tower(Position pos){
        this.pos = pos;
    }

    public boolean didHit(){
        int n = rand.nextInt(2);
        if(n == 0){
            return false;
        }else{
            return true;
        }
    }

    public boolean canHit(Enemy enemy){
        Position enemyPos = enemy.getPos();
        for(int x = -range; x <= range; x++){
            for(int y = -range; y <= range; y++){
                if(enemyPos.equals(new Position(this.pos.getX() + x, this.pos.getY() + y))){
                    return true;
                }
            }
        }
        return false;
    }
    public int getDamage(){
        return damage;
    }
    public int getFireRate(){
        return fireRate;
    }

    public Position getPosition(){
        return pos;
    }
    public String getIconPath(){
        return iconPath;
    }

}
