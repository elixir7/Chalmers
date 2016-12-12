/**
 * Created by hajo
 */
public class Position {
    private int x;
    private int y;

    public Position(int x, int y){
        this.x = x;
        this.y = y;
    }

    public int getX(){
        return x;
    }
    public int getY(){
        return y;
    }


    public void setX(int val){
        x = val;
    }
    public void setY(int val){
        y = val;
    }


    @Override
    public boolean equals(Object obj){
        if(obj instanceof Position) {
            Position pos = (Position) obj;
            if (pos.getX() == x && pos.getY() == y) {
                return true;
            } else {
                return false;
            }
        }else{
            return false;
        }
    }

}
