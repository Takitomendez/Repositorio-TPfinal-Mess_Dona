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
    sprite.resize(61, 115);
  }


  /*--------Zona de operaciones-------*/
  /** se definen las operaciones a realizar */
  public void display() {
    imageMode(CENTER);
    image(this.sprite, this.posicion.x, this.posicion.y, this.widthFrame, this.heightFrame);
  }
  public void mover(float x) {
    posicion.x=x;
   /* if (keyPressed & (keyCode == LEFT)) {
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
   public void desarmar(Bomba bomba) {
   boolean isColliding = true;
   if((this.posicion.x+this.widthFrame) <= bomba.getPosicion().x){
   isColliding = false;
   }
   
   if(this.posicion.x >= (bomba.getPosicion().x+bomba.getWidthFrame())){
   isColliding = false;
   }
   
   if((this.posicion.y+this.heightFrame) <= bomba.getPosicion().y){
   isColliding = false;
   }
   
   if(this.posicion.y >= (bomba.getPosicion().y+bomba.getHeightFrame())){
   isColliding = false;
   }
   
   
   if(isColliding){ // evalua si hay colison
     println("colision");
     bomba.setEstado(false);
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
