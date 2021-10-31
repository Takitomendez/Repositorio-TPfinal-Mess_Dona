/** se define la clase */
class Jefe extends GameObject{
  
  
   /* ------Zona de atributos---------*/
   /** Se colocan los tributos de la clase*/
  private float vida;
  
  /**------Zona de constructores--------*/
  
  public Jefe(){
  }
  
  
  /*--------Zona de operaciones-------*/
  /** se definen las operaciones a realizar */
  public void invocarAvion(ListaAviones listaAviones){
    
  }
  public void invocarBomba(ListaBombas listaBombas){
  
  }
  public void explotar(){
  
  }
  public void display(){
  
  }
  
  
  
  
   /*--------Metodos accesores---------*/
  /** se colocan los metodos accesores */
   public float getVida(){
  return this.vida;
 }
public void setVida(float vida){
  this.vida = vida;
  }
  
}
