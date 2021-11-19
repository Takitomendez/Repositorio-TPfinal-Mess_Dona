/** se define la clase Jefe que hereda atributos de FrameObject*/
class Jefe extends FrameObject{
  
   /* ------Zona de atributos---------*/
   /** Se colocan los tributos de la clase*/
  private float vida;
  
  /**------Zona de constructores--------*/
 
  public Jefe(){  //cocntructor por defecto
    this.sprite = loadImage("Data/Sprites/AvionEnemigo/dron-tipo2-enemigo.png"); //carga la imagen desde Data para el sprite
    this.velocidad= new PVector(5,5);
    this.widthFrame= 330;
    this.heightFrame=330;
    this.posicion= new PVector(this.widthFrame,this.heightFrame);
    this.posXFrame=0;
    this.posYFrame=0;
    this.sprite.resize(1646,330);
    this.vida=900;
  }
 
  /*--------Zona de operaciones-------*/
  /** se definen las operaciones a realizar */
  public void invocarAvion(ListaAviones listaAviones){
    
  }
  public void invocarBomba(ListaBombas listaBombas){
  
  }
  public void explotar(){
  
  }
  public void display(){  //dibuja al enemigo en el lienzo
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
  
  public void mover(){   //permite al jefe moverse
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
