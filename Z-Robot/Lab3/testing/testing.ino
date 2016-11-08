#include <Servo.h>

const int pingPin = 13;
long duration;
int distance;

Servo pingServo;

void setup() {
 Serial.begin(9600);
 pingServo.attach(12);
 pingServo.write(1);
 delay(2000);
}
void loop() {
 for(int i = 15; i <= 165; i++){
  printData(i);
 }

 for(int i = 165; i > 15; i--){
  printData(i);
 }
}

void printData(int i){
  pingServo.write(i);
  delay(30);
  distance = calculateDistance();
  
  Serial.print(i);
  Serial.print(",");
  Serial.print(distance);
  Serial.print(".");
}

int calculateDistance(){
  pinMode(pingPin, OUTPUT); // Set pin to OUTPUT
  digitalWrite(pingPin, LOW); // Ensure pin is low
  delayMicroseconds(2);
  digitalWrite(pingPin, HIGH); // Start ranging
  delayMicroseconds(5); // with 5 microsecond burst
  digitalWrite(pingPin, LOW); // End ranging
  pinMode(pingPin, INPUT); // Set pin to INPUT
  duration = pulseIn(pingPin, HIGH); // Read echo pulse
  distance = duration * 0.034/2;
  return distance;
}

