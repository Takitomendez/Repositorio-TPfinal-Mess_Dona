/** se define la clase abstracta GameObject */
abstract class GameObject {

  /* ------Zona de atributos---------*/
  /** Se colocan los tributos de la clase*/
  protected PVector posicion; // inicia la posicion 
  protected int alto;  // inica el alto
  protected int ancho; // inicia el ancho
  protected PVector velocidad; // inicia la velocidad
  protected PImage imagen; // inicia la imagen
  protected Boolean estado; // inicia el estado

  /**------Zona de constructores--------*/

  public GameObject() { //constructor por defecto
  }

  /*--------Zona de operaciones-------*/
  /** se definen las operaciones a realizar */
  public abstract void display();


  /*--------Metodos accesores---------*/
  /** se colocan los metodos accesores */
  public PVector getPosicion() {
    return this.posicion;
  }
  public void setPosicion (PVector posicion) {
    this.posicion = posicion;
  }

  public int getAlto() {
    return this.alto;
  }
  public void setAlto (int alto) {
    this.alto = alto;
  }  

  public int getAncho() {
    return this.ancho;
  }
  public void setAncho (int ancho) {
    this.ancho = ancho;
  }  

  public PVector getVelocidad() {
    return this.velocidad;
  }
  public void setVelocidad (PVector velocidad) {
    this.velocidad = velocidad;
  }  

  public PImage getImagen() {
    return this.imagen;
  }
  public void setImagen (PImage imagen) {
    this.imagen = imagen;
  }
  public void setEstado(boolean estado) {
    this.estado=estado;
  }
  public boolean getEstado() {
    return this.estado;
  }
}
