/*
+VERSION:hc01.comV2.1
EAGLE VISION
*/


#include <SoftwareSerial.h>

SoftwareSerial BTSerial(10, 11); // RX | TX

void setup()
{
  pinMode(9, OUTPUT);  // Activa el pin KEY para que el modulo active AT
  digitalWrite(9, HIGH);
  Serial.begin(9600);
  Serial.println("Ingres los comandos AT:");
  BTSerial.begin(38400); 
}

void loop()
{

  // Esperando respuesta del modulo
  if (BTSerial.available())
    Serial.write(BTSerial.read());

  // Esperando respuesta de la consola
  if (Serial.available())
    BTSerial.write(Serial.read());
}
