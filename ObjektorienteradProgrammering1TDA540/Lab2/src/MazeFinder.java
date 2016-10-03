public class MazeFinder { 
	private Robot robot;
    private final int DEFAULT_DELAY = 20;
	public static void main(String[] args) { 
		MazeFinder finder = new MazeFinder(); 
		finder.createEnviroment(); 
		finder.findExit(); 
	}//main 

	public void createEnviroment() { 
		RobotWorld world = RobotWorld.load("src/maze.txt"); 
		robot = new Robot(2, 0, Robot.EAST, world);
		robot.setDelay(DEFAULT_DELAY);
	}//createEnviroment 

	// The robot finds the way through a simply connected maze
	//before: The maze is simply connected.
	//        The robot is at the entrance of the maze.
	//after:  The robot is at the exit of the maze
	public void findExit() {
		while(!robot.atEndOfWorld()){
            if(robot.frontIsClear()) {
                checkLeft();
            }else{
                robot.turnLeft();
                //Left Maze corner
                if(robot.frontIsClear()){
                    robot.move();
                }else{
                    //Right Maze corner
                    turnAround();
                    if(robot.frontIsClear()){
                        robot.move();
                    }
                    else{
                        //Maze dead end
                        turnRight();
                        robot.move();
                    }
                }
            }
        }
	}// findExit

    //before: nothing
    //after: Robot turns 180deg
    private void turnAround(){
        robot.setDelay(0);
        robot.turnLeft();
        robot.turnLeft();
        robot.setDelay(DEFAULT_DELAY);
    }

    //before: nothing
    //after: Robot makes a right turn by doing 3 left turns
    private void turnRight(){
        robot.setDelay(0);
        robot.turnLeft();
        robot.turnLeft();
        robot.turnLeft();
        robot.setDelay(DEFAULT_DELAY);
    }
//Maze dead end
    //before: front is clear
    //after: turns left if there is no block to the left,
    //       moves forward if not
    private void checkLeft(){
        robot.setDelay(0);
        robot.turnLeft();
        if(robot.frontIsClear()){
            robot.setDelay(DEFAULT_DELAY);
            robot.move();
        }else{
            //Turn back to where it was clear
            turnRight();
            robot.move();
        }
        robot.setDelay(DEFAULT_DELAY);
    }
}//MazeFinder
