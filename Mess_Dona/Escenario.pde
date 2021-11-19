//import gifAnimation.*;

/** se define la clase Escenario */
class Escenario {

  /* ------Zona de atributos---------*/
  /** Se colocan los tributos de la clase*/
  private PImage imagen;
  private PImage vida;
  private int puntaje;
  private int contadorVida ;  
  
  /**-------Zona de Contructores-----*/

  public Escenario() {      //constructor pr defecto
    this.puntaje=0;
    this.vida= loadImage("Data/Sprites/Vida.png");
    vida.resize(60, 60);
    contadorVida = 3;
  }

  /*--------Zona de operaciones-------*/
  /** se definen las operaciones a realizar */
  public void display() {         //dibuja al escenario en el lienzo
  }
  public void mostrarPuntaje() {   // muestra el puntaje con el escenario
    textSize(30);
    fill(#FFFFFF);
    textAlign(CENTER);
    text("PUNTAJE: " + puntaje, width/2, height/30);
  }
  public void mostrarVida() {       //muestra la vida del dron con el escenario
    text("Vida: ", width/25, height/25);
    image(vida, width/10, height/30);
    fill(#050505);
    text(contadorVida, width/10, height/20);
  }
  public void mostrarNivel() {      //muestra el nivel en el escenario
    
    if (getEstado()==2) {
      
      imagen = loadImage("Data/Sprites/Escenario/fondo-selva.gif");
     imagen.resize(width, height);
      background(imagen);
    }
    
    if (getEstado()==3) {
      imagen = loadImage("Data/Sprites/Escenario/fondo-cielo.gif");
      imagen.resize(width, height);
      background(imagen);
    }
    
    if (getEstado()==4) {
      imagen= loadImage("Data/Sprites/Escenario/giphy.gif");
      imagen.resize(width, height);
      background(imagen);
    }
  }

  public void mostrarVidaJefe(Jefe jefe) {   //muestra la vida del jefe en el escenario
    if (jefe.getVida()>=450) {
      fill(#12CB02);
    } else {
      fill(255, 0, 0);
    }
     rect(50, 50, jefe.getVida(), 30);
   /*  if(jefe.getVida()==0){
      win.play();
     }*/
  }
    public void mostrarEscenario() {          //muestra al escenario
  }
  
  /*--------Metodos accesores---------*/

  /** se colocan los metodos accesores */
  public PImage getImagen() {
    return this.imagen;
  }
  public void setImagen (PImage imagen) {
    this.imagen = imagen;
  }
  public int getPuntaje() {
    return this.puntaje;
  }
  public void setPuntaje(int puntaje) {
    this.puntaje = puntaje;
  }

  public PImage getVida() {
    return this.vida;
  }
  public void setVida(PImage vida) {
    this.vida = vida;
  }
  public int getContadorVida() {
    return this.contadorVida;
  }
  public void setContadorVida(int contadorVida) {
    this.contadorVida = contadorVida;
  }
}
