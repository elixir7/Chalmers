public class Escaper { 
	private Robot robot;
	private final int DEFAULT_DELAY = 250;
	private boolean finished = false;
	public static void main(String[] args) { 
		Escaper escaper = new Escaper(); 
		escaper.createEnviroment(); 
		escaper.findExit ();
	}//main 

	public void createEnviroment() { 
		RobotWorld  world = RobotWorld.load("src/room.txt"); 
		robot = new Robot(4, 2, Robot.EAST, world);
		robot.setDelay(DEFAULT_DELAY);
	}//createEnviroment 
 
	//before: robot is inside the room
	//after:  robot is standing in the exit facing the world outside
	public void findExit() {
		while(checkSides()){
			if(robot.frontIsClear()){
				System.out.println("Trying to find the wall");
				robot.move();
			}else{
			    System.out.println("Found the wall");
				turnRight();
				while(!finished){
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
	//after: moves forward, turns left and if the exit is to the left takes one step forward,
	//		 if not, makes a right turn
	private void checkForExit(){
		robot.move();
		robot.turnLeft();
		if(robot.frontIsClear()){
			System.out.println("Found exit, leaving this prison!");
			robot.move();
			finished = true;
		}else {
			System.out.println("No exit, going back to following the wall");
			turnRight();
		}
	}

	//before: front is clear
	//after:  checks both sides and returns true if they are clear and false any is false
	private boolean checkSides(){
		boolean clearRight = false;
		boolean clearLeft = false;
		boolean sidesClear;

		robot.setDelay(0);
		robot.turnLeft();

		clearLeft = robot.frontIsClear();
		//Not using turnAround() since it uses set robot.setDelay(DEFAULT_VALUE) which makes it show the turn.
		robot.turnLeft();
		robot.turnLeft();
		clearRight = robot.frontIsClear();

		if(clearLeft && clearRight){
			sidesClear = true;
		}else{
			sidesClear = false;
		}

		robot.turnLeft();
		robot.setDelay(DEFAULT_DELAY);

		return sidesClear;
	}
}//Escaper
