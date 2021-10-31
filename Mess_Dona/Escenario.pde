/** se define la clase */
class Escenario{
  
  
  /* ------Zona de atributos---------*/
  /** Se colocan los tributos de la clase*/
  private PImage imagen;
  
  /**-------Zona de Contructores-----*/
  
  public Escenario(){
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
