#include <Servo.h>

Servo servoRight;
Servo servoLeft;

void setup() {
  servoLeft.attach(11);
  servoRight.attach(10);
  
  tone(4, 3000, 1000);
  delay(1000);

  Serial.begin(9600);

  
}
float tLeft;
long tRight;
float ndShade;
void loop() {
  tLeft = rcTime(8);
  tRight= rcTime(6);
  
  ndShade = tLeft/(tLeft + tRight) - 0.5;

  Serial.println("tLeft       ndShade       tRight");
  Serial.print(tLeft);
  Serial.print("          ");
  Serial.print(ndShade);
  Serial.print("           ");
  Serial.println(tRight);

  if(ndShade > 0.1){
    //Mer ljus på höger öga, sväng höger
    Serial.println("Turning Right!");
    maneuver(1700, 1610);
  }else if(ndShade < -0.1){
    //Mer ljus på vänster öga, sväng vänster
    Serial.println("Turning Left!");
    maneuver(1300, 1300);
  }else{
    Serial.println("LET'S GO!");
    forward();
  }


  delay(100);
}

long rcTime(int pin){
  pinMode(pin, OUTPUT);
  digitalWrite(pin, HIGH);
  delay(1);
  pinMode(pin, INPUT);
  digitalWrite(pin, LOW);
  long time = micros();
  while(digitalRead(pin));
  time = micros() - time;
  return time;
}

void forward(){
  servoLeft.writeMicroseconds(1700);
  servoRight.writeMicroseconds(1390);
}

void maneuver(int speedLeft, int speedRight){
  servoLeft.writeMicroseconds(speedLeft);
  servoRight.writeMicroseconds(speedRight);
}

