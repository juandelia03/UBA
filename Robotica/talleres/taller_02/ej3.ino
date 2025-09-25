#define TRIGGER 7
#define ECHO 3
#define PULSADOR 2

int volatile tiempo_inicial = -1;

void handle_bump(){
  digitalWrite(LED_BUILTIN, HIGH);
  Serial.println("APRETADO");
}

void handle_echo(){
  if(digitalRead(ECHO)){
    tiempo_inicial = micros();
  } else {
    int tiempo_final = micros();
    float d = (tiempo_final - tiempo_inicial) * 0.0343 / 2;
    Serial.println(d);
  }
}

void setup(){ 
  pinMode(PULSADOR, INPUT_PULLUP);

  pinMode(TRIGGER, OUTPUT);
  pinMode(ECHO, INPUT);
  attachInterrupt(digitalPinToInterrupt(ECHO), handle_echo, CHANGE);
  attachInterrupt(digitalPinToInterrupt(PULSADOR),handle_bump,CHANGE);

  Serial.begin(9600);


}

void loop(){
  delayMicroseconds(2);
  digitalWrite(TRIGGER, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIGGER, LOW);

  digitalWrite(LED_BUILTIN, HIGH);
  digitalWrite(LED_BUILTIN, LOW);
  
}