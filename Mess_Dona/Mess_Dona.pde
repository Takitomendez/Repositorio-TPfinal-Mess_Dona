import processing.sound.*;  
SoundFile sonido;

Dron dron;
Escenario escenario;
int tiempoBomba =20;
int contador=1;
private ListaBombas listaBombas;
/** Se establece la configuracion inicial*/
public void setup() {
  size(1000, 700); 
  sonido= new SoundFile(this,"metal-slug.mp3");
  sonido.play();
  dron = new Dron();
  listaBombas = new ListaBombas();
  escenario= new Escenario();
  
}
/** Se dibuja el sketch*/
public void draw() {
  background (#000000);
  escenario.mostrarEscenario();
  escenario.mostrarNivel();
  escenario.mostrarPuntaje(dron);
  escenario.mostrarVida(dron);
  dron.display();
  dron.mover(mouseX);
 // escenario.mostrarNivel();
  for(Bomba b:listaBombas.getBombas()){
    b.display();
    b.mover();
  }
  if(contador<= tiempoBomba){

    if(contador==tiempoBomba){  
      listaBombas.agregarBomba(new Bomba());
    } 
    contador++;
  }
  else{
    contador=1;
  }

}
