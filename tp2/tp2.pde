PImage foto1, foto2, foto3, foto4;
String texto1, texto2, texto3, texto4;
int segundos;
int posX, posY, anchoBoton, altoBoton;
PFont font;
int posTextoX = -300;
int posTextoY = 480;

void setup() {
  size(640, 480);

  // imagenes cargadas
  foto1 = loadImage("image1.png");
  foto2 = loadImage("image2.png");
  foto3 = loadImage("image3.png");
  foto4 = loadImage("image4.png");
  // textos de cada pantalla
  texto1 = "Counter-Strike 2 es un shooter en primera persona donde dos equipos compiten en rondas rápidas y tácticas. Uno planta una bomba, el otro intenta detenerlo. Tiene una jugabilidad enfocada en la puntería, la estrategia, el trabajo en equipo y la comunicacion.";
  texto2 = "CS2 es la versión más nueva de un juego con más de 20 años de historia. Fue mejorado con un nuevo motor gráfico pero mantiene el estilo clásico que lo hizo popular.";
  texto3 = "En CS2 hay una buena variedad de mapas, rediseñados para verse mejor y ser más claros sin cambiar demasiado su estructura original. El sistema de rangos va desde Silver hasta Global Elite. El modo Premier usa un sistema Elo pensado para competir en serio.";
  texto4 = "CS2 tiene una gran escena competitiva con torneos como los Majors y ligas como ESL o BLAST. Equipos profesionales compiten cada año y el juego ofrece herramientas para entrenar, analizar y jugar al más alto nivel.";

  // tamaño y posicion de el boton
  posX = 465;
  posY = 400;
  anchoBoton = 100;
  altoBoton = 40;

  // fuente usada en la presentacion
  font = loadFont("ProcessingSans-Regular-32.vlw");
  textFont(font);
}

void draw() {
  background(0);

  if (frameCount % 60 == 0) {
    segundos++;
  }

  // animacion donde entra el texto
  if (posTextoX < 30) {
    posTextoX = posTextoX + 5;
  }
  if (posTextoY > 80) {
    posTextoY = posTextoY - 5;
  }

  // animacion titulos
  int tamañoTitulo = 22 + (frameCount % 38) / 3;

  if (segundos <= 6) {
    image(foto1, 0, 0);
    stroke(255, 40); // borde blanco suave
    strokeWeight(1);
    fill(0, 120); // fondo negro con menor opacidad
    rect(20, 20, 600, 200);
    fill(255);
    noStroke();
    textSize(tamañoTitulo);
    text("¿Qué es Counter-Strike 2?", 30, 40, 580, 60);
    textSize(18);
    text(texto1, posTextoX, posTextoY, 580, 300);
  } else if (segundos > 6 && segundos <= 12) {
    image(foto2, 0, 0);
    stroke(255, 40);
    strokeWeight(1);
    fill(0, 120);
    rect(20, 20, 600, 200);
    fill(255);
    noStroke();
    textSize(tamañoTitulo);
    text("El último juego de una saga histórica", 30, 40, 580, 60);
    textSize(18);
    text(texto2, posTextoX, posTextoY, 580, 300);
  } else if (segundos > 12 && segundos <= 18) {
    image(foto3, 0, 0);
    stroke(255, 40);
    strokeWeight(1);
    fill(0, 120);
    rect(20, 20, 600, 200);
    fill(255);
    noStroke();
    textSize(tamañoTitulo);
    text("Mapas y rangos", 30, 40, 580, 60);
    textSize(18);
    text(texto3, posTextoX, posTextoY, 580, 300);
  } else {
    image(foto4, 0, 0);
    stroke(255, 40);
    strokeWeight(1);
    fill(0, 120);
    rect(20, 20, 600, 200);
    fill(255);
    noStroke();
    textSize(tamañoTitulo);
    text("Competitivo y torneos", 30, 40, 580, 60);
    textSize(18);
    text(texto4, posTextoX, posTextoY, 580, 300);
    
    // dibujar boton
    fill(0);
    rect(posX, posY, anchoBoton, altoBoton, 10);
    fill(200);
    textSize(18);
    text("Reiniciar", posX + 10, posY + 25);
  }
}

void mousePressed() {
  if (frameCount > 240) {
    if (mouseX > posX && mouseX < posX + anchoBoton && mouseY > posY && mouseY < posY + altoBoton) {
      segundos = 0;
      posTextoX = -300;
      posTextoY = 480;
    }
  }
}
