
import gifAnimation.*;
import ddf.minim.*;


AudioPlayer sonido;
AudioPlayer win;
AudioPlayer gameover;
Minim minim;

Gif animation; 

Dron dron;
Dron dron2;
Dron dron3;
Escenario escenario;
ListaDisparos listDisparos;
Jefe jefe;

int tiempoBomba =200;
int contador=1;
int timePlane=25;
int cont=29;

private int estado;
PImage imagen;
private ListaBombas listaBombas;
ArrayList<Explosion> explosiones;
private ListaAviones listaAviones;

//private ListaAviones listaAvionesB;
/** Se establece la configuracion inicial*/
public void setup() {
  size(1100,762); // 1100,700
  
  animation = new Gif(this, "malvinas3.gif"); //Se carga el archivo GIF del fondo del lienzo.
  
  animation.play();
  
  
   minim = new Minim(this);
  sonido = minim.loadFile("Data/music2.mp3");
   minim = new Minim(this);
  win = minim.loadFile("Data/Victoria.mp3");
   minim = new Minim(this);
  gameover = minim.loadFile("Data/Derrota.mp3");
//   sonido= new SoundFile(this, "music2.mp3");
//  win= new SoundFile(this, "Victoria.mp3");
//   gameover= new SoundFile(this, "Derrota.mp3");
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
/** Se dibuja el sketch*/
public void draw() { 
  
  
  if (estado==1) { 
    
    imagen = loadImage("Data/Sprites/LOGO2.png");
    imagen.resize(width, height);
    background (imagen);
    text("Utiliza el mouse para mover al dron",width/2,height-650);
    text("Pulsa ENTER para iniciar el juego", width/2, height-50);
    textAlign(CENTER);
    textSize(30);
    fill(#FFFFFF);
  }
  if(estado==5 || estado==6){
  
  sonido.pause();
  }
  
  
  if (estado ==2) {
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
  
  if ( estado==3) {
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
  }
  if(escenario.getPuntaje()==7){
   estado = 3;
  }
  if (estado==4) {
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
  if(escenario.getPuntaje()==20){
   estado=4;
   escenario.setPuntaje(0);
  }
  
  
  if (estado ==5) {
 
 //   imagen = loadImage("Data/Sprites/malvinas.gif");
 //    imagen.resize(width, height);
  
    background (animation);
    text("LAS MALVINAS SON ARGENTINAS!!!", width/2, height-80);
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
     
    cont=29;
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


public void keyPressed() {
  if (keyCode == ENTER && (estado == MaquinaEstado.Intro || estado == MaquinaEstado.VICTORIA || estado == MaquinaEstado.GAME_OVER)){
    estado = MaquinaEstado.Nivel_3;
    escenario.setContadorVida(3);
    escenario.setPuntaje(0);
    jefe.setVida(900);
    listaBombas = new ListaBombas();
    sonido.rewind();
  //  sonido.play();
    win.pause();
    win.rewind();
    gameover.pause();
    gameover.rewind();
  }
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
