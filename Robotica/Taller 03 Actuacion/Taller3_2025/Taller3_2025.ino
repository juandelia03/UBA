#include <Encoder.h>

#define SIMULACION 0
/* Definiciones de pines */
#if SIMULACION

#define PIN_EN 5
#define PIN_MOT_A 6
#define PIN_MOT_B 7
#define PIN_ENC_A 2
#define PIN_ENC_B 3

#else

#define PIN_MOT_A 5
#define PIN_MOT_B 6
#define PIN_ENC_A 2
#define PIN_ENC_B 3

#endif

Encoder enc(PIN_ENC_A, PIN_ENC_B);


/* Variables globales */
float prev_pos = 0;  // pos anterior del encoder
float tiempo_anterior_control_loop;

float ITerm = 0;
double pid_input, pid_output, pid_setpoint, pid_last_input;

/*constantes globales pid */
#define PWM_MIN 30
#define PWM_MAX 255
#define PID_P  20
#define PID_I  25
#define PID_D  0
#define CICLO_CONTROL_TIEMPO 10 // milisegundos

void setup()
{ 
  // seteo serial
  Serial.begin(115200);
   
  pid_setpoint = 1.2;
  pid_last_input = 0;
  tiempo_anterior_control_loop = millis();
  


 // inicializo los pines del motor
  pinMode(PIN_MOT_A, OUTPUT);      // inicializo el pin A del motor como una salida
  pinMode(PIN_MOT_B, OUTPUT);      // inicializo el pin B del motor como una salida
  
  // seteo en 0 la velocidad del motor
  digitalWrite(PIN_MOT_A,0);        
  digitalWrite(PIN_MOT_B,0);
  #if SIMULACION
  pinMode(PIN_EN, OUTPUT);
  analogWrite(PIN_EN, 0);
  #endif
  
  Serial.print("setpoint: "); Serial.print(pid_setpoint); 
  Serial.print(" p: "); Serial.print(PID_P);
  Serial.print(" i: "); Serial.print(PID_I);
  Serial.print(" d: "); Serial.println(PID_D);
}

/****************************** CICLO PRINCIPAL ***************************/

void loop()
{
  ciclo_control();  
}

/***************************** CICLO DE CONTROL **********************/

void ciclo_control()
{
  float tiempo_control = millis();
  int delta_t = tiempo_control  - tiempo_anterior_control_loop;
  if (delta_t >= CICLO_CONTROL_TIEMPO)
  {
    tiempo_anterior_control_loop = tiempo_control;
    
    float velocidad = calcular_velocidad(delta_t);

    /************* PARTE A RESOLVER POR ALUMNOS **************/
	
    float error = pid_setpoint - velocidad;
    float termino_P = error * PID_P;
    if (ITerm < 255){
      ITerm += error;
    }
    float termino_D = PID_D *(error - (pid_setpoint - pid_last_input));
    
    int pwm = termino_P + termino_D + (ITerm* PID_I);
    
	if (pwm > PWM_MAX){
    	pwm = PWM_MAX;
    } else if (pwm < -PWM_MAX){
    	pwm = -PWM_MAX;
    }
    
    pid_last_input = velocidad;
  
    
    set_motor_pwm(pwm);
    /************* FIN PARTE A RESOLVER POR ALUMNOS **************/
    
    Serial.print("vel (°/ms): "); Serial.print(velocidad,5); Serial.print(" pwm: "); Serial.print(pwm); Serial.print(" t: "); Serial.print(tiempo_control,5);Serial.print(" delta_t: "); Serial.println(delta_t);
//    Serial.print("vel (rpm): "); Serial.print(velocidad*60*1000/360,5); Serial.print(" pwm: "); Serial.print(pwm); Serial.print(" t: "); Serial.print(tiempo_control,5);Serial.print(" delta_t: "); Serial.println(delta_t);
  }  
}


/************************* FUNCIONES AUXILIARES ***********************************/

float calcular_velocidad(double delta_t)
{
  int encoder_ticks;
  #if SIMULACION
  encoder_ticks = 900;
  #else
  encoder_ticks = 480;
  #endif

  /************* PARTE A RESOLVER POR ALUMNOS **************/
	long pos = encoder_position();
  long delta_pos = pos - prev_pos;
  prev_pos = pos;
  return (delta_pos/delta_t)/encoder_ticks*360;
  /************* FIN PARTE A RESOLVER POR ALUMNOS **************/
}

void set_motor_pwm(int pwm)
{
  int forward = 0;
  int backward = 0;
  int pwm_en = 0;
  /************* PARTE A RESOLVER POR ALUMNOS **************/
  if(pwm>0){
  	forward = 1;
    backward = 0;
    pwm_en = pwm;
  } else{
  	forward = 0;
    backward = 1;
    pwm_en = -pwm;
  }
  /************* FIN PARTE A RESOLVER POR ALUMNOS **************/
  deadzone_pwm(forward, backward, pwm_en);
}

void deadzone_pwm(int pwm_f, int pwm_b, int pwm_en){

  #if SIMULACION == 1
  
  int pwm_en_dead = pwm_en - PWM_MIN;
  
  digitalWrite(PIN_MOT_B, pwm_en_dead > 0 ? pwm_f : LOW);
  digitalWrite(PIN_MOT_A, pwm_en_dead > 0 ? pwm_b : LOW);
  analogWrite(PIN_EN, pwm_en_dead > 0 ? pwm_en_dead : 0);
  
  #else
  
  analogWrite(PIN_MOT_B, pwm_f > 0 ? pwm_en : 0);
  analogWrite(PIN_MOT_A, pwm_b > 0 ? pwm_en : 0);
  
  #endif
}

long encoder_position(void)
{
  
  return enc.read();
 
}
