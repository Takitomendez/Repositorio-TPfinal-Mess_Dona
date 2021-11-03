/** se define la clase */
class Bomba extends FrameObject{
  
  /* ------Zona de atributos---------*/
  /** Se colocan los tributos de la clase*/
  private float danio;
  
  /**------Zona de constructores--------*/
  
  public Bomba(){
    this.sprite = loadImage("Data/Sprites/Bomba/bomba.png");
    this.posicion= new PVector(random(20,width-20),-50);
    this.velocidad= new PVector(0,20);
    this.widthFrame= 38;
    this.heightFrame=66;
    this.posXFrame=1;
    this.posYFrame=0;
    this.estado= true;
  }
  

  /*--------Zona de operaciones-------*/
 /** se definen las operaciones a realizar */
  public void display(int p){
    if(this.estado != false){
    sprite.resize(150,66);
    image(sprite.get(widthFrame*p,posYFrame,widthFrame,heightFrame),posicion.x,posicion.y);
    }
    frameRate(8);
  }
  public void mover(){
    this.posicion.add(this.velocidad);
    if(posXFrame<3){
      posXFrame++;
    }
    else{
      posXFrame=0;
    }
    display(posXFrame);
    
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
