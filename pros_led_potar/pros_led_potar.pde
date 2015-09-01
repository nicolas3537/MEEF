import processing.serial.*;

Serial mySerialPort;
int xPos = 1;
int serialValue;
int[] yPos;
int delay = 16;

void setup() {
 size(680, 600);
 println(Serial.list());
 mySerialPort = new Serial(this, Serial.list()[0], 9600);
 mySerialPort.bufferUntil('\n');
 //Set initial backgrounf
 yPos = new int[width];
}

void draw() {
 background(0);
 stroke(255,255,0,120);
 for(int i =0 ; i<width; i+=50)
  line(i,0,i, height);
 for (int i=0; i<height; i+=50)
  line(0,i,width,i);
  
 stroke(255,0,0);
 strokeWeight(1);
 int yPosPrev = 0 ; int xPosPrev = 0;
 println(serialValue);
 // décaler les valeurs de l'array vers la gauche
 for (int x = 1; x < width; x++) 
  yPos[x-1] = yPos[x];
  //Joindre les nouvelles coordonées de la souris à l'éxtrémité droite du tableau
  yPos[width -1 ] = serialValue;
  //Affichage du tableau
  for (int x = 0 ; x < width; x++) {
   if (x>0)
    line(xPosPrev, yPosPrev, x, yPos[x]);
   xPosPrev = x;        // Stockage de la dernière position x
   yPosPrev = yPos[x];  // Stockage de la dernière position y
  }
}

void serialEvent(Serial myserialPort) {
   String portStream = mySerialPort.readString();
   float data = float(portStream);
   serialValue = height - (int(map(data, 0,1023,10,height-10)));
}
