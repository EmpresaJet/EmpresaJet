
/**
* Configurações iniciais sobre o sensor
* TCRT5000
*/
 
int switch_pin = 7;
void setup()
{
Serial.begin(9600);

pinMode(switch_pin, INPUT);
}
void loop()
{
/**
* Bloco do TCRT5000
*/

if(digitalRead(switch_pin) == LOW){
  int prat1 = random(1, 4);
  
Serial.print(prat1);
Serial.print(";");
}

else {
Serial.print(0);
Serial.print(";");

}

int prat2 = random(0, 4);
int prat3 = random(0, 7);
int prat4 = random(0, 4);
int prat5 = random(0, 7);


Serial.print(prat2);
Serial.print(";");

Serial.print(prat3);
Serial.print(";");

Serial.print(prat4);
Serial.print(";");

Serial.print(prat5);
Serial.println(";");

delay(8000);
}