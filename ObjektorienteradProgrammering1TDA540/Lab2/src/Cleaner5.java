public class Cleaner5 {
        private Robot robot;
        private final int DEFAULT_DELAY = 250;
        private Location startPosition;
        public static void main(String[] args) {
                Cleaner5 cleaner = new Cleaner5();
                cleaner.createEnviroment();
                cleaner.cleanCorridors();
        } //main

        private void createEnviroment() {
                RobotWorld world = RobotWorld.load("src/square3.txt");
                robot = new Robot(1, world.getNumCols() - 4, Robot.WEST, world);
                robot.setDelay(DEFAULT_DELAY);
        }//createEnviroment 

	//before: The room has four corridors, forming a square
	//        The robot is located in beginning of one of the corridors
	//        Each corridor might be different
	//        Not all cells are dark
	//after:  All cells in the corridors are light.
	//        The robot has the same location and facing the same direction
        private void cleanCorridors() {
            cleanCorridorUpToPosition();
        }//cleanCorridors

        // before: none
        // after: robot cleans up all dark blocks and stops at the starting position
        private void cleanCorridorUpToPosition(){
            startPosition = robot.getLocation();

            //Starts the loop going because startingPosition will be equal to currentPosition the first time.
            clearBlockinFront();

            //Checks if the currentPosition is equal to the startingPosition
            while(!startPosition.equals(robot.getLocation())){
                if (robot.frontIsClear()) {
                    clearBlockinFront();
                } else {
                    robot.turnLeft();
                    //If the robot is still facing a wall the direction is clockwise, that means it has to turnAround.
                    if(!robot.frontIsClear()){
                        turnAround();
                    }
                }
            }
        }

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
}//Cleaner5


