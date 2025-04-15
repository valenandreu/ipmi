PImage img;
void setup(){
size(800,400);
background(#DBE1E2);
img= loadImage("notebook.png");
}

void draw(){
image(img, 0, 0);
  println("Posicion X: "+mouseX+ "," + "Posicion Y: " + mouseY); //ubicacion del mouse
strokeWeight(1); //grosor de la lines de la cortina
stroke(260); //color de la linea de la cortina
fill(#BFB8A3); //color de cortina
rect(400,0,400,255); //cortina

strokeWeight(10); //tamaño de pixeles de la linea
stroke(0); // color de la linea
line (400,0,400,400); //linea

fill(#252E2C); //color de pantalla
rect(500,120,189,120,3); //marco de notebook


 fill(128);   //color de la camara  
  noStroke();    //para que no tenga bordes la camara  
  ellipse(595, 121, 4, 4); //camara
  
  fill(30);
rect(498,242,190,22);

fill(30);
triangle(294+400,243,342+400,298,64+400,295); //para la perspectiva de la base de la notebook
fill(30);
triangle(98+400,243,349+400,295,66+398,299); //para la perspectiva de la base de la notebook
fill(30);
rect(470,291,269,7);

fill(26);   //perspectiva
triangle(81+400,303,480,299,467,299);

fill(26); 
triangle(328+400,304,735,294,736,298);
 
//touchpad
fill(20);
rect(160+400,280,71,22,8);

fill(0);
rect(565,291,30,5,8);

fill(0);
rect(598,291,30,5,8);

//especificaciones en amarillo
fill(#695A1C);
rect(91+400,284,10,7,4);

fill(#695A1C);
rect(107+400,284,10,7,4);

fill(#695A1C);
rect(124+400,284,10,7,4);

fill(#695A1C);
rect(141+400,284,10,7,4);

fill(0); //teclado
quad(506,247,687,247,702,276,498,275); 

strokeWeight(2); //tamaño de pixeles de la linea
stroke(30); // color de la linea
line (504,253,689,253); //linea

strokeWeight(2); //tamaño de pixeles de la linea
stroke(30); // color de la linea
line (502,260,693,260); //linea

strokeWeight(2); //tamaño de pixeles de la linea
stroke(30); // color de la linea
line (498,268,696,268); //linea

//arreglo de errores
fill(#DBE1E2);
 noStroke();
ellipse(743,293,8,4);

fill(#DBE1E2);
 noStroke();
ellipse(743,293,12,7);

fill(29);
rect(480,298,250,6);

fill(30);
rect(465,297,27,3); //tapar un lugar que quedo en blanco 
}
