#include <Servo.h>

Servo servoRight;
Servo servoLeft;
Servo pingServo;

const int pingPin = 13;
long duration;
int distance;
int sumLeft;
int sumRight;

int sweepArr[180];

void setup() {
 Serial.begin(9600);
 pingServo.attach(12);
 servoLeft.attach(11);
 servoRight.attach(10);
 Serial.println("SETUP STARTED");
 pingServo.write(1);
 delay(1000);
 for(int i = 1; i <= 179; i = i + 2){
  pingServo.write(i);
  delay(10);
  distance = calculateDistance();
  sweepArr[i] = distance;
 }
 evaluate();
 
 Serial.print("Left: ");
 Serial.print(sumLeft);
 Serial.print(", Right: ");
 Serial.print(sumRight);
 Serial.println();
 pingServo.write(1);
 delay(1000);
 Serial.println("SETUP COMPLETE");
 delay(1000);
}

void loop() {
 
 for(int i = 1; i <= 179; i = i + 2){
  pingServo.write(i);
  delay(10);
  distance = calculateDistance();
  sweepArr[i] = distance;
  //printData(i, distance);
 }
 evaluate();
 Serial.print("Left: ");
 Serial.print(sumLeft);
 Serial.print(", Right: ");
 Serial.print(sumRight);
 Serial.println();
 
 

 for(int i = 179; i >= 1; i = i - 2){
  pingServo.write(i);
  delay(10);
  distance = calculateDistance();
  sweepArr[i] = distance;
  //printData(i, distance);
 }
 evaluate();
 Serial.print("Left: ");
 Serial.print(sumLeft);
 Serial.print(", Right: ");
 Serial.print(sumRight);
 Serial.println();
 
}

//Prints out current angle and distance to the Srial monitor
void printData(int deg, int dist){
  Serial.print(deg);
  Serial.print("deg : ");
  Serial.print(dist);
  Serial.print("cm.");
  Serial.println();
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

void forward(){
  servoLeft.writeMicroseconds(1700);
  servoRight.writeMicroseconds(1390);
}

void maneuver(int speedLeft, int speedRight){
  servoLeft.writeMicroseconds(speedLeft);
  servoRight.writeMicroseconds(speedRight);
}

