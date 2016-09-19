public class Cleaner2 {
        private Robot robot;
        public static void main(String[] args) {
                Cleaner2 cleaner = new Cleaner2();
                cleaner.createEnviroment();
                cleaner.cleanCorridors();
        } //main

        private void createEnviroment() {
                RobotWorld world = RobotWorld.load("src/square2.txt");
                robot = new Robot(1, world.getNumCols() - 2, Robot.WEST, world);
                robot.setDelay(250);
        }//createEnviroment 

	//before: The room has four corridors, forming a square
	//        The robot is located in beginning of one of the corridors, facing the corridor
	//        in counter-clockwise direction.
	//        Each corridor has a length of five cells.
	//        Not all cells are dark
	//after:  All cells in the corridors are light.
	//        The robot has the same location and facing the same direction
        private void cleanCorridors() {
                for(int i = 0; i < 4; i++){
                    clearCorridorInFront();
                }
        }//cleanCorridors

        // before: none
        // after: robot cleans four blocks in front of him and makes a left turn
        private void clearCorridorInFront(){
                for(int i = 0; i < 4; i++){
                        //Move robot 1 block forward
                        robot.move();
                        //Check if the block under the robot it dark
                        if(robot.onDark()){
                                //Make the block under the robot light
                                robot.makeLight();
                        }
                }
                robot.turnLeft();
        }
}//Cleaner2

