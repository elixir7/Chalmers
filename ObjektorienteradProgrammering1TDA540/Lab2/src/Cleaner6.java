/*
    Since the cleanCorridorUpToPosition() method already is trying which direction the corner is no need to change anything.
 */

public class Cleaner6 {
        private Robot robot;
        private Location startPosition;
        private final int DEFAULT_DELAY = 250;
        public static void main(String[] args) {
                Cleaner6 cleaner = new Cleaner6();
                cleaner.createEnviroment();
                cleaner.cleanCorridors();
        } //main

        private void createEnviroment() {
                RobotWorld world = RobotWorld.load("src/loop.txt");
                robot = new Robot(1, world.getNumCols() - 4, Robot.EAST, world);
                robot.setDelay(DEFAULT_DELAY);
        }//createEnviroment 

	//before: The corridors form a closed loop
	//after:  All cells in the corridors are light.
	//        The robot has the same location and facing the same direction
        private void cleanCorridors() {
            startPosition = robot.getLocation();

            //Starts the loop going because startingPosition will be equal to currentPosition the first time.
            clearBlockinFront();

            //Checks if the currentPosition is equal to the startingPosition
            while(!startPosition.equals(robot.getLocation())){
                if (robot.frontIsClear()) {
                    clearBlockinFront();
                } else {
                    robot.turnLeft();
                    //If the robot is still facing a wall the direction is clockwise, that means it has to make a 180deg turn.
                    if(!robot.frontIsClear()){
                        turnAround();
                    }
                }
            }
        }//cleanCorridors


    // before: none
    // after: robot cleans a single block in front of it if it is dark
    private void clearBlockinFront(){
        robot.move();
        if(robot.onDark()) {
            robot.makeLight();
        }
    }

    //before: nothing
    //after: Robot turns 180deg
    private void turnAround(){
        robot.setDelay(0);
        robot.turnLeft();
        robot.turnLeft();
        robot.setDelay(DEFAULT_DELAY);
    }
}//Cleaner6


