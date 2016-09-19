public class Cleaner5 {
        private Robot robot;
        private Location startPosition;
        public static void main(String[] args) {
                Cleaner5 cleaner = new Cleaner5();
                cleaner.createEnviroment();
                cleaner.cleanCorridors();
        } //main

        private void createEnviroment() {
                RobotWorld world = RobotWorld.load("src/square3.txt");
                robot = new Robot(1, world.getNumCols() - 4, Robot.EAST, world);
                robot.setDelay(250);
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
            //Prevents the robot from just standing still due to the while loop
            clearBlockinFront();

            //Checks if the currentPosition is equal to the startingPosition
            while(!startPosition.equals(robot.getLocation())){
                if (robot.frontIsClear()) {
                    clearBlockinFront();
                } else {
                    robot.turnLeft();
                    //If the robot is still facing a wall the direction is clockwise, that means it has to make a 180deg turn.
                    if(!robot.frontIsClear()){
                        robot.turnLeft();
                        robot.turnLeft();
                    }
                }
            }
        }

        // before: none
        // after: robot cleans a single block in front of it if it is dark
        private void clearBlockinFront(){
            //Move robot 1 block forward
            robot.move();
            //Check if the block under the robot it dark
            if(robot.onDark()) {
                //Make the block under the robot light
                robot.makeLight();
            }
        }
}//Cleaner5


