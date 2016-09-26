public class Cleaner4 {
        private Robot robot;
        private final int DEFAULT_DELAY = 250;
        public static void main(String[] args) {
                Cleaner4 cleaner = new Cleaner4();
                cleaner.createEnviroment();
                cleaner.cleanCorridors();
        } //main

        private void createEnviroment() {
                RobotWorld world = RobotWorld.load("src/square3.txt");
                robot = new Robot(1, world.getNumCols() - 2, Robot.SOUTH, world);
                robot.setDelay(DEFAULT_DELAY);
        }//createEnviroment 

	//before: The room has four corridors, forming a rectangle
	//        The robot is located in beginning of one of the corridors, facing the corridor
	//        in counter-clockwise or clockwise direction.
	//        Each corridor might be different
	//        Not all cells are dark
	//after:  All cells in the corridors are light.
	//        The robot has the same location and facing the same direction
        private void cleanCorridors() {
            for(int i = 0; i < 4; i++) {
                clearCorridorInFront();
                //If the robot is still facing a wall the direction is clockwise, that means it has to turn around.
                if(!robot.frontIsClear()){
                    turnAround();
                }
            }
        }//cleanCorridors

        // before: none
        // after: robot cleans the corridor in front of him and makes a left turn
        private void clearCorridorInFront(){
            while(robot.frontIsClear()){
                robot.move();
                //Check if the block under the robot it dark
                if(robot.onDark()){
                    robot.makeLight();
                }
            }
            robot.turnLeft();
        }

        //before: nothing
        //after: Robot turns 180deg
        private void turnAround(){
            robot.setDelay(0);
            robot.turnLeft();
            robot.turnLeft();
            robot.setDelay(DEFAULT_DELAY);
        }
}//Cleaner4


