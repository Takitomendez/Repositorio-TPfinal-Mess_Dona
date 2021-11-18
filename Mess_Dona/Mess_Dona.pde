import processing.sound.*;
SoundFile sonido;

Dron dron;
Dron dron2;
Escenario escenario;

//Explosion explosion;
int tiempoBomba =200;
int contador=1;
int timePlane=25;
int cont=69;
//int contPlane=1;*/
private int estado;
PImage imagen;
private ListaBombas listaBombas;
ArrayList<Explosion> explosiones;
private ListaAviones listaAviones;
//private ListaAviones listaAvionesB;
/** Se establece la configuracion inicial*/
public void setup() {
  size(1000, 700);
//  sonido= new SoundFile(this, "music2.mp3");
//  sonido.play();
  dron = new Dron();
  dron2 = new Dron(2);
//  listaBombas = new ListaBombas();
  listaAviones = new ListaAviones();
//  listaAvionesB = new ListaAviones();  
  escenario= new Escenario();
  estado = MaquinaEstado.Intro;
  explosiones = new ArrayList();
//  frameRate(20);

  
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
  //  escenario.mostrarEscenario();
    escenario.mostrarNivel();
    escenario.mostrarPuntaje();
    escenario.mostrarVida();
    dron.display();
    dron.mover();
    listaBombas.displayBombas(explosiones, escenario, cont);
    listaBombas.validarImpacto(dron);
    for(int i=0;i<explosiones.size();i++){
      Explosion e = explosiones.get(i);
      e.display();
    }
    println(cont+"  Tamaño lista: "+listaBombas.getBombas().size());
    if (listaBombas.getBandera()){
      println(cont+"    cont");
      cont--;
    }
    
/*   if(random(100)>=95){
      listaBombas.agregarBomba(new Bomba());
    }
/*    if (contador<= tiempoBomba) {

      if (contador==tiempoBomba) {
        cont++;
   //     listaBombas.agregarBomba(new Bomba());
      }
      contador++;
    } else {
      contador=1;
    }*/
  }
  if ( estado==3) {
 //   escenario.mostrarEscenario();
    escenario.mostrarNivel();
    escenario.mostrarPuntaje();
    escenario.mostrarVida();
    dron2.display();
    dron2.mover();
    listaAviones.displayAviones(explosiones, escenario);
    listaAviones.validarImpacto(dron2);
    if(random(100)>=90){
      listaAviones.agregarAvion(new Avion(new PVector(5,0)));
    }
  /*  if(cont<= timePlane){
      if(cont==timePlane){
        listaAviones.agregarAvion(new Avion( new PVector(13,0)));
      } 
      cont++;
    }else{
      cont=1;
    }*/
  }
  if(escenario.getPuntaje()==25){
   estado = 3;
  }
  
  if (estado==4) {
    escenario.mostrarNivel();
    escenario.mostrarPuntaje();
    escenario.mostrarVida();
  }
  if(escenario.getPuntaje()==50){
   estado=4;
  }
  if (estado ==5) {
    text("SALVASTE LAS MALVINAS!!!", width/2, height-50);
    text("Pulsa ENTER para reiniciar el juego", width/2, height-30);
    textAlign(CENTER);
    textSize(30);
    fill(#FFFFFF);
  }
  if (estado==6) {
    imagen = loadImage("Data/Sprites/Game Over.png");
    imagen.resize(width, height);
    background (imagen);
    
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
  if (keyCode == ENTER && (estado == MaquinaEstado.Intro || estado == MaquinaEstado.VICTORIA || estado == MaquinaEstado.GAME_OVER)){
    estado = MaquinaEstado.Nivel_2;
    escenario.setContadorVida(3);
    escenario.setPuntaje(0);
  }
  
  

  
/**  for(Avion ab:listaAvionesB.getAviones()){
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

public void setCont(int cont){
    this.cont=cont;
  }
 public int getCont(){
    return this.cont;
  }

public int getEstado(){
 return this.estado;
}
