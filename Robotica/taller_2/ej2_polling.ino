// #define TRIGGER 7
// #define ECHO 4

// void setup(){ 
//   pinMode(TRIGGER, OUTPUT);
//   pinMode(ECHO, INPUT);
//   Serial.begin(9600);
// }

// void loop(){
 
//   delayMicroseconds(2);
//   digitalWrite(TRIGGER, HIGH);
//   delayMicroseconds(10);
//   digitalWrite(TRIGGER, LOW);

//   while(!digitalRead(ECHO));
//   int tiempo_inicial = micros();
//   while(digitalRead(ECHO)); //mientras sigue habiendo un uno espero
//   int tiempo_final = micros();
//   float d = (tiempo_final - tiempo_inicial) * 0.0343 / 2;

//   Serial.println(d);

  

  

// }