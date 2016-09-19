public class MazeFinder { 
	private Robot robot; 
	public static void main(String[] args) { 
		MazeFinder finder = new MazeFinder(); 
		finder.createEnviroment(); 
		finder.findExit(); 
	}//main 

	public void createEnviroment() { 
		RobotWorld world = RobotWorld.load("src/maze.txt"); 
		robot = new Robot(2, 0, Robot.EAST, world);
		robot.setDelay(20);
	}//createEnviroment 

	// The robot finds the way through a simply connected maze
	//before: The maze is simply connected.
	//        The robot is at the entrance of the maze.
	//after:  The robot is at the exit of the maze
	public void findExit() {
		while(true){
		    if(!robot.atEndOfWorld()){
                if (robot.frontIsClear()) {
                    //Turn left and check if it is clear
                    robot.turnLeft();
                    if(robot.frontIsClear()){
                        robot.move();
                    }else{
                        //Turn back to where it was clear
                        robot.turnLeft();
                        robot.turnLeft();
                        robot.turnLeft();
                        robot.move();
                    }
                }else {
                    robot.turnLeft();
                    if(robot.frontIsClear()){
                        //Left turn
                        robot.move();
                    }else{
                        robot.turnLeft();
                        robot.turnLeft();
                        if(robot.frontIsClear()){
                            //Right Turn
                            robot.move();
                        }else{
                            //Robot is in an endpoint
                            robot.turnLeft();
                            robot.turnLeft();
                            robot.turnLeft();
                            robot.move();
                        }
                    }

                }
            }else{
                //The robot found the end
                break;
            }

		}

	}// findExit 
}//MazeFinder
