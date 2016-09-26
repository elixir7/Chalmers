public class Escaper { 
	private Robot robot;
	private final int DEFAULT_DELAY = 150;
	public static void main(String[] args) { 
		Escaper escaper = new Escaper(); 
		escaper.createEnviroment(); 
		escaper.findExit ();
	}//main 

	public void createEnviroment() { 
		RobotWorld  world = RobotWorld.load("src/room.txt"); 
		robot = new Robot(3, 5, Robot.SOUTH, world);
		robot.setDelay(50);
	}//createEnviroment 
 
	//before: robot is inside the room
	//after:  robot has escaped the room
	public void findExit() {
		while(!robot.atEndOfWorld()){
			if(robot.frontIsClear()){
			    System.out.println("Trying to find the wall");
				robot.move();
			}else{
			    System.out.println("Found the wall");
				turnRight();
				while(!robot.atEndOfWorld()){
					//Following the wall clockwise
					if(robot.frontIsClear()){
						checkForExit();
					}else{
						//Edge
						turnRight();
					}
				}
			}
		}

	}// moveToEntrance

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

	//before: nothing
	//after: moves forward, turns left and if the exit is to the left,
	//		 if not, starts following the wall again
	private void checkForExit(){
		robot.move();
		robot.turnLeft();
		if(robot.frontIsClear()){
			System.out.println("Found exit, leaving this prison!");
			while(!robot.atEndOfWorld()){
				robot.move();
			}
		}else {
			System.out.println("No exit, going back to following the wall");
			turnRight();
		}
	}
}//Escaper
