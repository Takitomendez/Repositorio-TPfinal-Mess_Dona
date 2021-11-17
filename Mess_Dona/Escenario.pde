/** se define la clase */

class Escenario {

  /* ------Zona de atributos---------*/
  /** Se colocan los tributos de la clase*/
  private PImage imagen;
  private PImage vida;
  private int puntaje;
  private int contadorVida ;
  /**-------Zona de Contructores-----*/



  public Escenario() {
    this.imagen= loadImage("Data/Sprites/Escenario/fondo-selva.gif");
    imagen.resize(width, height);
    this.puntaje=0;
    this.vida= loadImage("Data/Sprites/Vida.png");
    vida.resize(60, 60);
    contadorVida = 3;
  }
  public void mostrarEscenario() {
    background(imagen);
  }
  /*--------Zona de operaciones-------*/
  /** se definen las operaciones a realizar */
  public void display() {
  }
  public void mostrarPuntaje(Dron dron) {
    textSize(30);
    fill(#FFFFFF);
    textAlign(CENTER);
    text("PUNTAJE: " + puntaje, width/2, height/30);
    if (puntaje < 100) {
      puntaje=puntaje + 1;
    }
  }
  public void mostrarVida(Dron dron) {
    text("Vida: ", width/25, height/25);
    image(vida, width/10, height/30);
    fill(#050505);
    text(contadorVida, width/10, height/20);
  
  }
  public void mostrarNivel() {
    if (this.puntaje == 25) {

      imagen = loadImage("Data/Sprites/Escenario/fondo-cielo.gif");
      imagen.resize(width, height);
      background(imagen);
      fill(#050505);
      textSize(20);
      text("NIVEL 2", width-100, 50);
    } else {
      if (this.puntaje == 50) {
        imagen= loadImage("Data/Sprites/Escenario/giphy.gif");
        imagen.resize(width, height);
        background(imagen);
        fill(#050505);
        textSize(20);
        text("NIVEL 3", width-100, 50 );
      }
    }
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
