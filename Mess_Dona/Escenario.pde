

/** se define la clase Escenario */
class Escenario {

  /* ------Zona de atributos---------*/
  /** Se colocan los tributos de la clase*/
  private PImage imagen; //inicializa la imagen  de fondo de la MaquinaEstado.Intro
  private PImage vida;  // inicializa la imagen de vida del dron
  private int puntaje;  // inicializa el puntaje del dron
  private int contadorVida ; // inicializa el contador de vida del dron

  
  /**-------Zona de Contructores-----*/

  public Escenario() {      //constructor pr defecto
    this.puntaje=0;        // inicializa el puntaje del dron
    this.vida= loadImage("Data/Sprites/Vida.png"); // carga la imagen de vida del dron
    vida.resize(60, 60); // redefine el tamaño de la imagen de vida
    contadorVida = 3; // inicializa el contador de vida en 3
  }

  
  /*--------Zona de operaciones-------*/
  /** se definen las operaciones a realizar */
 
  public void mostrarPuntaje() {   // muestra el puntaje con el escenario

    textSize(30);    // Define el tamaño del texto
    fill(#FFFFFF);   // Define el color del texto
    textAlign(CENTER);  // Alinea en el centro el texto
    text("PUNTAJE: " + puntaje, width/2, height/30);  // Muestra el texto en el lienzo
  }
  public void mostrarVida() {       //muestra la vida del dron con el escenario
    text("Vida: ", width/25, height/25);  // Muestra el texto en el lienzo
    image(vida, width/10, height/30); // Muestra la imagen en el lienzo
    fill(#050505);  // Define el color del texto
    text(contadorVida, width/10, height/20); // muestra el contador el en lienzo
  }
  public void mostrarNivel(Gif fondo, int estado) {      //muestra el nivel en el escenario
    if (estado==1){  //inicializa la imagen  de fondo de la MaquinaEstado.Intro
      imagen = loadImage("Data/Sprites/LOGO2.png"); // carga la imagen de fondo
      imagen.resize(width, height); // redefine el tamaño de la imagen
      background (imagen); // llama al fondo del nivel
    }
    if (estado==2) { //inicializa la imagen  de fondo de la MaquinaEstado.Nivel_1
      background(fondo); // llama al fondo del nivel
    }
    
    if (estado==3) { //inicializa la imagen  de fondo de la MaquinaEstado.Nivel_2
      background(fondo); // llama al fondo del nivel
    }
    
    if (estado==4) { //inicializa la imagen  de fondo de la MaquinaEstado.Nivel_3
      background(fondo); // llama al fondo del nivel
    }
    if (estado==5) { //inicializa la imagen  de fondo de la MaquinaEstado.VICTORIA
      background(fondo); // llama al fondo del nivel
    }
    if (estado==6) { //inicializa la imagen  de fondo de la MaquinaEstado.GAME_OVER
      background(fondo); // llama al fondo del nivel
    }
    
  }

  public void mostrarVidaJefe(Jefe jefe) {   //muestra la vida del jefe en el escenario
    if (jefe.getVida()>=450) { // condicionamos el cambio de color de la barra de vida del jefe
      fill(#12CB02); // definimos el color verde de la barra de vida
    } else {
      fill(255, 0, 0); // define el color rojo de la barra de vida
    }
     rect(30, 50, jefe.getVida(), 30); // se crea una recta 
  
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
