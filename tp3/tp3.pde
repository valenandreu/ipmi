//video explicativo: https://youtu.be/GtgjLiKGQFk

PImage imagen;
int cantidad = 21;
float distorsion = 0;
float espacio;
float grosor = 2.0;
float limitedistorsion = 80; //limite para que no invada la imagen
boolean cambiarGrosor = true;
color colorTrazo = 255;

void setup() {
  size(800, 400);
  imagen = loadImage("imagen.jpg");
  rectMode(CENTER);
  espacio = calcularEspacio(width / 2 - 1, 1); //calcula el espacio entre cuadrados
}

void draw() {
  background(0);
  image(imagen, 0, 0, width / 2, height); //muestra la imagen a la izquierda

  stroke(255);
  strokeWeight(2);
  line(width / 2, 0, width / 2, height); //linea divisoria central

  if (cambiarGrosor) {
    ajustarGrosor(mouseY); //ajusta el grosor segun la posicion vertical del mouse
  }
  strokeWeight(grosor);
  stroke(colorTrazo);

  pushMatrix();
  translate(600, height / 2); //traslada al centro del lado derecho

  for (int i = 0; i < cantidad; i++) {
    float lado = espacio * i + random(-distorsion, distorsion); //aplica distorsion al tamaño

    for (int j = 0; j < 3; j++) {
      stroke(colorTrazo + j * 30); //cambia el color para efecto de profundidad
      rect(0, 0, lado + j * 3, lado + j * 3); //dibuja cada cuadrado con leve variacion
    }
  }

  fill(255);
  rect(0, 0, 7, 7); //cuadrado blanco central
  noFill();
  popMatrix();
}

//funcion con return que genera un color rgb aleatorio
color colorRGB(float valorMaximo) {
  return color(random(valorMaximo), random(valorMaximo), random(valorMaximo));
}

//funcion sin return que ajusta el grosor del trazo
void ajustarGrosor(float valorY) {
  grosor = 2 + (valorY / 100.0);
  if (grosor > 5) {
    grosor = 5; //limite maximo del grosor
  }
}

//calcula el espacio entre los cuadrados
float calcularEspacio(float anchoZona, float separacionBase) {
  return (anchoZona / (cantidad - 1)) - separacionBase;
}

//al hacer clic se activa la distorsion y cambia el color del trazo
void mousePressed() {
  if (mouseX > width / 2) {
    if (distorsion < limitedistorsion) {
      distorsion += 0.5; //se incrementa solo si no supera el limite
    }
    cambiarGrosor = true;
    colorTrazo = colorRGB(255); //genera y asigna color aleatorio
  }
}

//al presionar r se reinician todas las variables
void keyPressed() {
  if (key == 'r' || key == 'R') {
    distorsion = 0;
    grosor = 2.0;
    cambiarGrosor = false;
    colorTrazo = 255;
  }
}
