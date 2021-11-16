/** se define la clase */
class Dron extends FrameObject {


  /* ------Zona de atributos---------*/
  /** Se colocan los tributos de la clase*/
  private int puntaje;
  private int vida;


  /** constructor parametrizado*/
  public Dron() {  
    this.sprite = loadImage("Data/Sprites/DronPrincipal/dron-n1.png");
    this.posicion = new PVector(width/2, height-150);
    this.widthFrame = 61;
    this.heightFrame =115;
    this.velocidad= new PVector(20, 0);
    this.estado= true;
    
  }


  /*--------Zona de operaciones-------*/
  /** se definen las operaciones a realizar */
  public void display() {
    imageMode(CENTER);
    image(this.sprite, this.posicion.x, this.posicion.y, this.widthFrame, this.heightFrame);
    sprite.resize(61, 115);
  }
  public void mover(float x) {
    this.posicion.x=x;


    /**if (keyPressed & (keyCode == LEFT)) {
     if (posicion.x>widthFrame/2) {
     posicion.x = posicion.x-velocidad.x;
     }
     }
     if (keyPressed & (keyCode == RIGHT)) {
     if (posicion.x<width-widthFrame/2) {
     posicion.x = posicion.x+velocidad.x;
     }
     }*/
  }
  public void desarmar(ListaBombas listBombs) {
    
    boolean existeColision = false;

    for (Bomba b:listBomb.getBombas()) {
      if (((this.posicion.x+this.widthFrame/2) <= b.getPosicion().x )) {
        existeColision = false;

      }

      if (this.posicion.x - this.widthFrame/2 >(b.getPosicion().x+b.getWidthFrame())) {
        existeColision = false;
      }

      if ((this.posicion.y-this.heightFrame/2) <= b.getPosicion().y+b.getHeightFrame()) {
        existeColision = false;
      }

     if (this.posicion.y+this.heightFrame/2 >= (b.getPosicion().y+b.getHeightFrame())) {
        existeColision = false;
      }
      
      if(existeColision){   
        this.estado = false;
        b.setEstado(false);
      }
          
      existeColision = true;
    
  }
}
  public void devolverBomba(Bomba bomba, Nivel nivel) {
  }
  public void explotar( Avion avion) {
  }


  /*--------Metodos accesores---------*/
  /** se colocan los metodos accesores */

  public int getPuntaje() {
    return this.puntaje;
  }
  public void setPuntaje(int puntaje) {
    this.puntaje = puntaje;
  }

  public int getVida() {
    return this.vida;
  }
  public void setVida(int vida) {
    this.vida = vida;
  }
}
