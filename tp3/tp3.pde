//video explicativo https://www.youtube.com/watch?v=kVjd_Do1xkU

PImage imagen;
int cantidad = 21;
float distorsion = 0;
float espacio;
float grosor = 2.0;
boolean cambiarGrosor = true;
color colorTrazo = 255;

void setup() {
  size(800, 400);
  imagen = loadImage("imagen.jpg");
  rectMode(CENTER);
  noFill();
  espacio = calcularEspacio();
}

void draw() {
  background(0);
  image(imagen, 0, 0, width / 2, height); //imagen original a la izq

  //linea divisoria
  stroke(255);
  strokeWeight(2);
  line(width / 2, 0, width / 2, height);

  //color y grosor del trazo para los cuadrados
  stroke(colorTrazo);
  if (cambiarGrosor) {
    grosor = 2 + (mouseY / 100.0);
    if (grosor > 5) {
      grosor = 5;
    }
  }
  strokeWeight(grosor);

  pushMatrix();
  translate(600, height / 2); //centrado en el lado derecho

  for (int i = 0; i < cantidad; i++) {
    for (int j = 0; j < 1; j++) { //for anidado 
      float lado = espacio * i + random(-distorsion, distorsion);
      noFill();
      rect(0, 0, lado, lado);
    }
  }

  fill(255); //cuadrado central relleno
  rect(0, 0, 5, 5);
  noFill();
  popMatrix();
}

//calcula el espacio entre cuadrados
float calcularEspacio() {
  float anchoDisponible = width / 2 - 2;
  return (anchoDisponible / (cantidad - 1)) - 1;
}

//cambia color del trazo
void cambiarColorTrazo() {
  colorTrazo = color(random(255), random(255), random(255));
}

//clic aumenta distorsion y cambia color
void mousePressed() {
  if (mouseX > width / 2) {
    distorsion += 0.5;
    cambiarGrosor = true;
    cambiarColorTrazo();
  }
}

//tecla "r" reinicia
void keyPressed() {
  if (key == 'r' || key == 'R') {
    distorsion = 0;
    grosor = 2.0;
    cambiarGrosor = false;
    colorTrazo = 255;
  }
}
