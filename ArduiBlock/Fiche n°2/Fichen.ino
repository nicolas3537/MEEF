/*   ----------------  Fiche n�2  ----------------------
      Une led pilot�e par un interrupteur 
*/


const int Led = 8;     // LED en broche 8
const int Bouton = 9;  // le bouton en borche 9
int BoutonEtat;  // variable pour enregistrer l'�tat du bouton
 
// the setup routine runs once when you press reset:
void setup() {
  // initialize the digital pin as an output.
  pinMode(Led, OUTPUT);   // Broche de la led en tant que sortie 
  pinMode(Bouton, INPUT); // Broche du bouton poussoir en tant d'entr�e
}

// the loop routine runs over and over again forever:
void loop() {
  BoutonEtat = digitalRead(Bouton);
  if (BoutonEtat == HIGH) {
  	digitalWrite(Led, HIGH);   // Allume la LED
  }
  else {
  	digitalWrite(Led, LOW);    // �teint la LED  
  }
}
