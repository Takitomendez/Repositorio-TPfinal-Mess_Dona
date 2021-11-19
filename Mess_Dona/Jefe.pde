/** se define la clase */
class Jefe extends FrameObject{
  
  
   /* ------Zona de atributos---------*/
   /** Se colocan los tributos de la clase*/
  private float vida;
  
  /**------Zona de constructores--------*/
 
  public Jefe(){
    this.sprite = loadImage("Data/Sprites/AvionEnemigo/dron-tipo2-enemigo.png");
    this.velocidad= new PVector(random(15,20),random(19,28));
    this.widthFrame= 330;
    this.heightFrame=330;
    this.posicion= new PVector(random(this.widthFrame,width-this.widthFrame*2),random(this.heightFrame,height-this.heightFrame*2));
    this.posXFrame=0;
    this.posYFrame=0;
    this.sprite.resize(1646,330);
    this.vida=1040;
  }
 
  /*--------Zona de operaciones-------*/
  /** se definen las operaciones a realizar */

  public void explotar(){
    frameRate(5);
    PImage jefe = loadImage("Data/Sprites/AvionEnemigo/sprite-colisicion-dron-tipo2-enemigo.png");
    jefe.resize(1060,538);
    int ancho=353;
    int alto=538;
    int posX=0;
    int posY=0;
    PImage frame = jefe.get(posX,posY,ancho,alto);
    imageMode(CENTER);
    image(frame,width/2,height/2);
    if(posX <= jefe.width-ancho){
      posX+=ancho;
    }else{
      posX=0;
    }
  }
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
 //   frameRate(10);
  }
  
  public void mover(){
    if (this.posicion.x>=width-this.widthFrame/2 || this.posicion.x<=this.widthFrame/2){
      this.velocidad.x = this.velocidad.x * -1;
    }
    if (this.posicion.y>=height-this.heightFrame/2 || this.posicion.y<=this.heightFrame/2){
      this.velocidad.y = this.velocidad.y * -1;
    }
    this.posicion.add(this.velocidad);
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
