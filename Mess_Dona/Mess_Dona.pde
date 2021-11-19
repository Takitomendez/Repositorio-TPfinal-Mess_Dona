
//import gifAnimation.*;
import ddf.minim.*;  //importa la biblioteca minim
import processing.sound.*; // importa la biblioteca sound
import gifAnimation.*;

AudioPlayer sonido;    //crea un objeto de la biblioteca AudioPlayer
AudioPlayer win;       //crea un objeto de la biblioteca AudioPlayer 
AudioPlayer gameover;  //crea un objeto de la biblioteca AudioPlayer
Minim minim;           //crea un objeto de la biblioteca Minim



Gif animation; 


Dron dron;         //crea un objeto de la clase Dron
Dron dron2;        // crea un objeto de la clase dron tipo 2
Dron dron3;        // crea un objeto de la calse dron tipo 3
Escenario escenario;     //creal al objeto del escenario
ListaDisparos listDisparos;   //crea la lista de disparos
Jefe jefe;    //crea al objeto jefe

int tiempoBomba =200;       
int contador=1;
int timePlane=25;
int cont=28;

private int estado;
PImage imagen;
private ListaBombas listaBombas;
ArrayList<Explosion> explosiones;
private ListaAviones listaAviones;

//private ListaAviones listaAvionesB;


/**----------- Se establece la configuracion inicial------------*/

public void setup() {
  size(1100,762); 
  
  animation = new Gif(this, "malvinas3.gif"); //Se carga el archivo GIF del fondo del lienzo.
  
  animation.play();
  
  
   minim = new Minim(this);
  sonido = minim.loadFile("Data/music2.mp3");
   minim = new Minim(this);
  win = minim.loadFile("Data/Victoria.mp3");
   minim = new Minim(this);
  gameover = minim.loadFile("Data/Derrota.mp3");
   sonido.play();
   
  dron = new Dron(1);
  dron2 = new Dron();
  dron3 = new Dron(3);
  listaAviones = new ListaAviones(); 
  escenario= new Escenario();
  estado = MaquinaEstado.Intro;
  explosiones = new ArrayList();
  listDisparos = new ListaDisparos();
  jefe = new Jefe();
}

/** -----------Se dibuja el sketch------------*/
public void draw() { 
  
  
  if (estado==1) {     //dibuja la introduccion del juego
    
    imagen = loadImage("Data/Sprites/LOGO2.png");
    imagen.resize(width, height);
    background (imagen);
    text("Utiliza el mouse para mover al dron",width/2,height-650);
    text("Pulsa ENTER para iniciar el juego", width/2, height-50);
    textAlign(CENTER);
    textSize(30);
    fill(#FFFFFF);
  }
  if(estado==5 || estado==6){       //si se gana o se pierde la musica se detendrá
  
  sonido.pause();
  }
  
  
  if (estado ==2) {                 //dibuja el contenido para el nivel 1
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
    if (listaBombas.getBandera()){
      cont--;
    }
  }
  
  if ( estado==3) {         // dibuja el contenido del nivel 2
    escenario.mostrarNivel();
    escenario.mostrarPuntaje();
    escenario.mostrarVida();
    dron2.display();
    dron2.mover();
    listaAviones.displayAviones( escenario);
    listaAviones.validarImpacto(explosiones,dron2);
    if(random(100)>=90){
      listaAviones.agregarAvion(new Avion());
    }
    for(int i=0;i<explosiones.size();i++){
      Explosion e = explosiones.get(i);
      e.display();
    }
  }
  if(escenario.getPuntaje()==25){
   estado = 3;
  }
  if (estado==4) {             //dibjua el contenido para el nivel 3
    escenario.mostrarNivel();
    escenario.mostrarPuntaje();
    escenario.mostrarVida();
    escenario.mostrarVidaJefe(jefe);
    jefe.display();
    dron3.display();
    dron3.mover();
    dron3.disparar(listDisparos.getDisparos());
    dron3.collide(jefe);
    listDisparos.displayDisparos();
    listDisparos.validarImpacto(jefe, explosiones);
    for(int i=0;i<explosiones.size();i++){
      Explosion e = explosiones.get(i);
      e.display();
    }
  }
  if(escenario.getPuntaje()==70){
   estado=4;
   escenario.setPuntaje(0);
  }
  
  

  if (estado ==5) {     //dibuja el contenido en caso de Victoria

    background (animation);
    text("LAS MALVINAS SON ARGENTINAS!!!", width/2, height-80);
    text("Pulsa ENTER para reiniciar el juego", width/2, height-30);
    textAlign(CENTER);
    textSize(30);
    fill(#FFFFFF);
    cont=28;
  }
  
  
  if (estado==6) {    //se dibuja el contenido en caso de GameOver
 
    imagen = loadImage("Data/Sprites/Game Over.png");
    imagen.resize(width, height);
    background (imagen);
    text("PERDISTE!!!", width/2, height-50);
    text("Pulsa ENTER para reiniciar el juego", width/2, height-30);
    textAlign(CENTER);
    textSize(30);
    fill(#FFFFFF);
     
    cont=28;
  }
  if(escenario.getContadorVida()==0){
   estado=6;
  gameover.play();
   listaBombas.getBombas().clear();
   listaAviones.getAviones().clear();
  }
  if(jefe.getVida() <= 0){
    estado=5;
    win.play();
  }
}


public void keyPressed() {     // establece la configuracion para el uso de teclas
  if (keyCode == ENTER && (estado == MaquinaEstado.Intro || estado == MaquinaEstado.VICTORIA || estado == MaquinaEstado.GAME_OVER)){
    estado = MaquinaEstado.Nivel_1;
    escenario.setContadorVida(3);
    escenario.setPuntaje(0);
    jefe.setVida(900);
    listaBombas = new ListaBombas();
    sonido.rewind();
    sonido.play();
    win.pause();
    win.rewind();
    gameover.pause();
    gameover.rewind();
  }
}
/**  Metodos Accesores  */
public void setCont(int cont){
    this.cont=cont;
  }
 public int getCont(){
    return this.cont;
  }

public int getEstado(){
 return this.estado;
}
