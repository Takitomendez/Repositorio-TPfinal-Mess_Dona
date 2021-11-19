/** se define la clase Dispara que hereda atributos de la clase FrameObject */
class Disparo extends FrameObject{
  
  /**-----------Zona de constructores--------*/
  
  public Disparo(PVector posicion, PVector velocidad){
    sprite = requestImage("Data/Sprites/shoot4.png");
    this.posicion = posicion;
    this.velocidad = velocidad;
    this.widthFrame = 172;
    this.heightFrame = 250;
    this.posXFrame = 156*3;
    this.posYFrame = 0;
  }
  /**---------Zona de Metodos----------*/
  
  public void display(){  //dibuja a los disparos en el lienzo
    PImage frame = sprite.get(this.posXFrame,this.posYFrame,this.widthFrame,this.heightFrame);
    frame.resize(20,50);
    imageMode(CENTER);
    image(frame,this.posicion.x,this.posicion.y);
    if(this.posYFrame < sprite.height-this.heightFrame){
      posYFrame+=this.heightFrame;
    }else{
      posYFrame=0;
    }
    move();
  }
  
  /* cambia la posición del disparo*/
  public void move(){
    this.posicion.add(velocidad);
  }

}
