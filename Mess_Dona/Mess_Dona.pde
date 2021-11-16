import processing.sound.*;
SoundFile sonido;

Dron dron;
Escenario escenario;
private int estado;
int tiempoBomba =20;
int contador=1;
PImage imagen;

private ListaBombas listaBombas;
/** Se establece la configuracion inicial*/
public void setup() {
  size(1000, 700);
  sonido= new SoundFile(this, "music2.mp3");
  sonido.play();
  dron = new Dron();
  listaBombas = new ListaBombas();
  escenario= new Escenario();
  estado = MaquinaEstado.Intro;
}
/** Se dibuja el sketch*/
public void draw() {
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
    dron.mover(mouseX);

    for (Bomba b : listaBombas.getBombas()) {
      b.display();
      b.mover();
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
}
