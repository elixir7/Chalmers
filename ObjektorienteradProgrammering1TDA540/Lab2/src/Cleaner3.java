public class Cleaner3 {
        private Robot robot;
        public static void main(String[] args) {
                Cleaner3 cleaner = new Cleaner3();
                cleaner.createEnviroment();
                cleaner.cleanCorridors();
        } //main

        private void createEnviroment() {
                RobotWorld world = RobotWorld.load("src/square3.txt");
                robot = new Robot(1, world.getNumCols() - 2, Robot.WEST, world);
                robot.setDelay(250);
        }//createEnviroment 

	//before: The room has four corridors, forming a square
	//        The robot is located in beginning of one of the corridors, facing the corridor
	//        in counter-clockwise direction.
	//        Each corridor might be different
	//        Not all cells are dark
	//after:  All cells in the corridors are light.
	//        The robot has the same location and facing the same direction
        private void cleanCorridors() {
            int counter = 0;
            while(true) {
                if (robot.frontIsClear()) {
                    clearBlockinFront();
                } else {
                    robot.turnLeft();
                }
                counter++;
                if(counter == 24){
                    break;
                }
            }
        }//cleanCorridors

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
}//Cleaner3

