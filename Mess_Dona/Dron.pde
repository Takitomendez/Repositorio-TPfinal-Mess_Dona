/** se define la clase */
class Dron extends GameObject{
  
  
  /* ------Zona de atributos---------*/
  /** Se colocan los tributos de la clase*/
  private int puntaje;
  private int vida;
  
  
  /** constructor parametrizado*/
  public Dron(PVector posicion, int alto, int ancho, PVector velocidad, PImage imagen, int puntaje, int vida ){
  this.posicion = posicion;
  this.alto = alto;
  this.ancho = ancho;
  this.velocidad = velocidad;
  this.imagen = imagen;
  this.puntaje = puntaje;
  this.vida = vida;
  }
    

 /*--------Zona de operaciones-------*/
 /** se definen las operaciones a realizar */
  public void display() {
  }
  public void mover() {
  }
  public void desarmar(Bomba bomba, Nivel nivel) {
  }
  public void devolverBomba(Bomba bomba, Nivel nivel) {
  }
  public void explotar( Avion avion) {
  }
  
  
  /*--------Metodos accesores---------*/
 /** se colocan los metodos accesores */
   
   public int getPuntaje(){
  return this.puntaje;
 }
  public void setPuntaje(int puntaje){
  this.puntaje = puntaje;
 }
  
  public int getVida(){
  return this.vida;
 }
public void setVida(int vida){
  this.vida = vida;
  }
  
}
