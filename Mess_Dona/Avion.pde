/** se define la clase */
class Avion extends FrameObject{
  
  /**------Zona de constructores--------*/
  
  public Avion(){
    this.sprite = loadImage("Data/Sprites/AvionEnemigo/dron-tipo2-enemigo.png");
    this.posicion= new PVector(random(20,width-20),-50);
    this.velocidad= new PVector(20,50);
    this.widthFrame= 82;
    this.heightFrame=81;
    this.posXFrame=1;
    this.posYFrame=0;
    this.estado= true;
    this.sprite.resize(414,81);
  }
  public Avion( PVector velocidad){
    this.sprite = loadImage("Data/Sprites/AvionEnemigo/dron-tipo1-enemigo.png");
    this.posicion= new PVector(random(20,width-20),-50);
    this.velocidad= velocidad;
    this.widthFrame= 105;
    this.heightFrame=105;
    this.estado= true;
    this.sprite.resize(105,105);
  }
  
 /*--------Zona de operaciones-------*/
 /** se definen las operaciones a realizar */
  public void display(int p, boolean t){
    if(this.estado != false){
      if (!t){
        image(sprite.get(widthFrame*p,posYFrame,widthFrame,heightFrame),posicion.x,posicion.y);
      }else{
        image(sprite.get(widthFrame,posYFrame,widthFrame,heightFrame),posicion.x,posicion.y);
      }
    }
    frameRate(8);
  }
  
  public void mover(boolean tipo){
    if (!tipo){
      if (this.posicion.x>=width || this.posicion.x<=0){
        this.velocidad.x = this.velocidad.x * -1;
      }
      this.posicion.add(this.velocidad);
      if(posXFrame<4){
        posXFrame++;
      }
      else{
        posXFrame=0;
      }
    }else{
      this.posicion.add(this.velocidad);
    }
    display(posXFrame, tipo);
  }
  public void explotar (Dron dron){
  }
 
}
