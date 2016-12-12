import java.util.Random;

public class Tower {
    int fireRate = 2;
    int range = 1;
    String iconPath = "icons/tower-icon.png";
    Random rand = new Random();
    Position pos;

    public Tower(Position pos){
        this.pos = pos;
    }

    public boolean didHit(){
        int n = rand.nextInt(1);
        if(n == 0){
            return false;
        }else{
            return true;
        }

    }
    public Position getPosition(){
        return pos;
    }
    public String getIconPath(){
        return iconPath;
    }

}
