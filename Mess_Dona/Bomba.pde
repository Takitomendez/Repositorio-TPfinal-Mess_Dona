/** se define la clase */
class Bomba extends FrameObject{
  
  /* ------Zona de atributos---------*/
  /** Se colocan los tributos de la clase*/
  private float danio;

  
  /**------Zona de constructores--------*/
  
  public Bomba(){
    this.sprite = loadImage("Data/Sprites/Bomba/bomba.png");
    this.posicion= new PVector(random(20,width-20),-50);
    this.velocidad= new PVector(0,10);
    this.widthFrame= 38;
    this.heightFrame=66;
    this.posXFrame=0;
    this.posYFrame=0;
    this.estado= true;
    sprite.resize(150,66);
  }
  

  /*--------Zona de operaciones-------*/
 /** se definen las operaciones a realizar */
  public void display(){
    PImage frame = sprite.get(this.posXFrame,this.posYFrame,this.widthFrame,this.heightFrame);
    imageMode(CENTER);
    image(frame,this.posicion.x,this.posicion.y);
    if(this.posXFrame <= sprite.width-this.widthFrame){
      posXFrame+=this.widthFrame;
    }else{
      posXFrame=0;
    }
    mover();
  }
  
  
  public void mover(){
    this.posicion.add(this.velocidad);
  }

  public void validar(){

  }
  
  /*--------Metodos accesores---------*/
  /** se colocan los metodos accesores*/ 
   public float getDanio(){
    return this.danio;
  }
   public void setDanio (float danio){
    this.danio = danio;
  }
  public void setEstado(boolean estado){
    this.estado=estado;
  }
  
  
}
