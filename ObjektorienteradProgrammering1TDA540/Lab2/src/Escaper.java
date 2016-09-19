public class Escaper { 
	private Robot robot;
	public static void main(String[] args) { 
		Escaper escaper = new Escaper(); 
		escaper.createEnviroment(); 
		escaper.moveToEntrance (); 
	}//main 

	public void createEnviroment() { 
		RobotWorld  world = RobotWorld.load("src/room.txt"); 
		robot = new Robot(2, 4, Robot.WEST, world);
		robot.setDelay(50);
	}//createEnviroment 
 
	//before: robot is inside the room
	//after:  robot is in the cell representing the the dorrjamb
	public void moveToEntrance() { 
		while(!robot.atEndOfWorld()){
			if(robot.frontIsClear()){
			    System.out.println("Trying to find the wall");
				robot.move();
			}else{
			    System.out.println("Found the wall");
				robot.turnLeft();
				robot.turnLeft();
				robot.turnLeft();
				while(!robot.atEndOfWorld()){
					//Following the wall clockwise
					if(robot.frontIsClear()){
                        robot.move();
						robot.turnLeft();
						if(robot.frontIsClear()){
							System.out.println("Found exit, leaving this prison!");
							robot.move();
							robot.move();
						}else {
                            System.out.println("No exit, going back to following the wall");
							robot.turnLeft();
							robot.turnLeft();
							robot.turnLeft();
						}
					}else{
						//Edge
						robot.turnLeft();
						robot.turnLeft();
						robot.turnLeft();
					}
				}
			}
		}

	}// moveToEntrance 
}//Escaper
