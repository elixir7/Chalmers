#include <Servo.h>

Servo servoRight;
Servo servoLeft;
Servo pingServo;

const int pingPin = 13;
long duration;
int distance;
int rightDistance;

void setup() {
 Serial.begin(9600);
 pingServo.attach(12);
 servoLeft.attach(11);
 servoRight.attach(10);

 //Center pingServo
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
    rightDistance =  rightDist();
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
