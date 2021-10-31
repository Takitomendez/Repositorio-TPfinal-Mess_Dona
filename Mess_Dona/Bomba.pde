/** se define la clase */
class Bomba extends GameObject{
  
  /* ------Zona de atributos---------*/
  /** Se colocan los tributos de la clase*/
  private float danio;
  
  /**------Zona de constructores--------*/
  
  public Bomba(){
  }
  

  /*--------Zona de operaciones-------*/
 /** se definen las operaciones a realizar */
  public void display(){
  }
  public void mover(){
  }
  public void explotar(Jefe jefe){
  }
  
  
  
  /*--------Metodos accesores---------*/
  /** se colocan los metodos accesores*/ 
   public float getDanio(){
    return this.danio;
  }
   public void setDanio (float danio){
    this.danio = danio;
  }
  
}
