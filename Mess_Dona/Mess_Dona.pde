import processing.sound.*;
SoundFile sonido;

Dron dron;
Escenario escenario;

//Explosion explosion;
int tiempoBomba =20;
int contador=1;
/*int timePlane=100;
int cont=1;
int contPlane=1;*/

private int estado;

PImage imagen;


private ListaBombas listaBombas;
ArrayList<Explosion> explosiones;
//private ListaAviones listaAviones;
//private ListaAviones listaAvionesB;
/** Se establece la configuracion inicial*/
public void setup() {
  size(1000, 700);
  sonido= new SoundFile(this, "music2.mp3");
  sonido.play();
  dron = new Dron();
  listaBombas = new ListaBombas();
  escenario= new Escenario();
  estado = MaquinaEstado.Intro;
  explosiones = new ArrayList();
//  frameRate(20);
//  listaAviones = new ListaAviones();
//  listaAvionesB = new ListaAviones();
  
}
/** Se dibuja el sketch*/
public void draw() {

 /* if(random(100)>=95){
    listaBombas.agregarBomba(new Bomba());
  }*/

  if (estado==1) {
    imagen = loadImage("Data/Sprites/LOGO2.png");
    imagen.resize(width, height);
    background (imagen);
    text("Pulsa ENTER para iniciar el juego", width/2, height-50);
    textAlign(CENTER);
    textSize(30);
    fill(#FFFFFF);
    
  }
  if (estado ==2) {
    escenario.mostrarEscenario();
    escenario.mostrarNivel();
    escenario.mostrarPuntaje(dron);
    escenario.mostrarVida(dron);
    dron.display();
    dron.mover();

 listaBombas.displayBombas(explosiones);
  listaBombas.validarImpacto(dron);
  for(int i=0;i<explosiones.size();i++){
    Explosion e = explosiones.get(i);
    e.display();
  }
    if (contador<= tiempoBomba) {

      if (contador==tiempoBomba) {
        listaBombas.agregarBomba(new Bomba());
      }
      contador++;
    } else {
      contador=1;
    }
  }
  if ( estado==3) {
    escenario.mostrarNivel();
    escenario.mostrarPuntaje(dron);
    escenario.mostrarVida(dron);
  }
  if (estado==4) {
    escenario.mostrarNivel();
    escenario.mostrarPuntaje(dron);
    escenario.mostrarVida(dron);
  }
  if (estado ==5) {
    text("SALVASTE LAS MALVINAS!!!", width/2, height-50);
    text("Pulsa ENTER para reiniciar el juego", width/2, height-30);
    textAlign(CENTER);
    textSize(30);
    fill(#FFFFFF);
  }
  if (estado==6) {
    
    text("PERDISTE!!!", width/2, height-50);
    text("Pulsa ENTER para reiniciar el juego", width/2, height-30);
    textAlign(CENTER);
    textSize(30);
    fill(#FFFFFF);
    
  }
  if(escenario.getContadorVida()==0){
   estado=6;
  }
}
public void keyPressed() {
  if (keyCode == ENTER && (estado == MaquinaEstado.Intro || estado == MaquinaEstado.VICTORIA || estado == MaquinaEstado.GAME_OVER));
  {
    estado = MaquinaEstado.Nivel_1;
  }

  
/* for(Avion ab:listaAvionesB.getAviones()){
    ab.mover(false);
  }
  if(contPlane<= timePlane){

    if(contPlane==timePlane){  
      listaAvionesB.agregarAvion(new Avion());
    } 
    contPlane++;
  }
  else{
    contPlane=1;
  }
  
  for(Avion a:listaAviones.getAviones()){
    a.mover(true);
  }
  if(cont<= timePlane){

    if(cont==timePlane){  
      listaAviones.agregarAvion(new Avion( new PVector(0,50)));
    } 
    cont=cont+2;
  }
  else{
    cont=1;
  }*/
}
