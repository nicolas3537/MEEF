int LED=6;

int sensorPin=0;
int val;

void setup(){
  Serial.begin(9600);
  pinMode(LED,OUTPUT);  
}

void loop(){
  val=analogRead(sensorPin);
  Serial.println(val);
  analogWrite(LED,map(val,0,1023,0,255));
  delay(10);
}
