#include <Servo.h>

Servo servoRight;
Servo servoLeft;
Servo pingServo;

const int pingPin = 13;
long duration;
int distance;

void setup() {
 Serial.begin(9600);
 pingServo.attach(12);
 servoLeft.attach(11);
 servoRight.attach(10);

 pingServo.write(90);
 delay(1000);
}

void loop() {
  forward();
  delay(75);
  distance = calculateDistance();
  Serial.print("Distance Forward: ");
  Serial.print(distance);
  Serial.println();
  
  if(distance < 6){
    stopOnSpot();
    int rightDistance =  rightDist();
    Serial.print("Right Distance: ");
    Serial.print(rightDistance);
    Serial.println();
    if(rightDistance < 15){
      turnLeft();
    }else{
      turnRight();
    }
  }
 
}

int rightDist(){
  pingServo.write(15);
  delay(500);
  int dist = calculateDistance();
  pingServo.write(90);
  delay(500);
  return dist;
}

void turnLeft(){
  maneuver(1300, 1300);
  delay(525);
}
void turnRight(){
  maneuver(1700, 1610);
  delay(550);
}

//Returns the distance at the current angle
int calculateDistance(){
  pinMode(pingPin, OUTPUT); // Set pin to OUTPUT
  digitalWrite(pingPin, LOW); // Ensure pin is low
  delayMicroseconds(2);
  
  digitalWrite(pingPin, HIGH); // Start ranging
  delayMicroseconds(5); // with 5 microsecond burst
  digitalWrite(pingPin, LOW); // End ranging
  
  pinMode(pingPin, INPUT); // Set pin to INPUT
  duration = pulseIn(pingPin, HIGH); // Read echo pulse
  distance = duration * 0.034/2;  //Convert to centimeters
  
  return distance;
}

void forward(){
  servoLeft.writeMicroseconds(1700);
  servoRight.writeMicroseconds(1390);
}
void stopOnSpot(){
  servoLeft.writeMicroseconds(1500);
  servoRight.writeMicroseconds(1500);
}

void maneuver(int speedLeft, int speedRight){
  servoLeft.writeMicroseconds(speedLeft);
  servoRight.writeMicroseconds(speedRight);
}

















/*
void printCompare(){
  Serial.print("Left: ");
 Serial.print(sumLeft);
 Serial.print(", Right: ");
 Serial.print(sumRight);
 Serial.println();
}
*/
/*
 * Maneuver(left, right)
 * Left faster = 1500+
 * Right Faster = 1500-
 */

/*
void move(){
  double r = (sumLeft / sumRight);
  double v;
  //More space to the left, turn left
  if(r > 1){
    v = (1/r) * 200;
    maneuver(1500 - v, 1300);
  }else if(r > 4){
    v = (1/(r/2)) * 200;
    maneuver(1500 - v, 1300);
  }
  //Turn Right
  else if(r < 1){
    v = r * 200;
    maneuver(1700, 1500 + v);
  } 
}
*/
/*
void evaluate(){
  sumLeft = 0;
  sumRight = 0;
  for(int i = 1; i <= 180; i = i + 2){
    if(i <= 90){
      sumRight = sumRight + sweepArr[i];
    }else{
      sumLeft = sumLeft + sweepArr[i];
    } 
  }
  
}
*/

