/** se define la clase */

class Escenario{
  /* ------Zona de atributos---------*/
  /** Se colocan los tributos de la clase*/
  private PImage imagen;
  /**-------Zona de Contructores-----*/
  
  public Escenario(){
     
    imagen= loadImage("Data/Sprites/Escenario/fondo-selva.gif");
    imagen.resize(width,height);
 
  }
  public void mostrarEscenario(){
  background(imagen);
   textSize(20);
    text("NIVEL 1",width/2,50);
  }
 /*--------Zona de operaciones-------*/
 /** se definen las operaciones a realizar */
 public void display(){
   
 }
 public void mostrarPuntaje(Dron dron){
 
 }
 public void mostrarVida(Dron dron){
 
 }
 public void mostrarNivel(Nivel nivel){
   imagen = loadImage("Data/Sprites/Escenario/fondo-cielo.gif");
   imagen.resize(width,height);
   if(dron.getPuntaje() == 15){
    background(imagen);
     textSize(20);
    text("NIVEL 2",width/2,50);
   }
    dron.puntaje = 0;
 }
   
   
   /*--------Metodos accesores---------*/
  /** se colocan los metodos accesores */
 public PImage getImagen(){
  return this.imagen;
 }
public void setImagen (PImage imagen){
  this.imagen = imagen;
  }  
}
