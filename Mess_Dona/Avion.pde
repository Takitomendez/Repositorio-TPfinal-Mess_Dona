/** se define la clase Avion que hereda de FrameObject */
class Avion extends FrameObject{
  
  /**------Zona de constructores--------*/
  
  
  public Avion(){ //constructorpor defecto
    this.sprite = loadImage("Data/Sprites/AvionEnemigo/dron-tipo1-enemigo.png");  // carga la imagen desde Data
    this.posicion= new PVector(-50,random(20,height-20));     //establece la posicion inicial del avion
    this.velocidad= new PVector(7,0); //establace la velocidad del avion
    this.widthFrame= 105;   //establece el ancho del frame
    this.heightFrame=105;    //establece  el alto del frame del avion
    this.estado= true;           //establece el estado del avion
    this.sprite.resize(90,70);  //modifica el tamaño del sprite
  }
  
 /*--------Zona de operaciones-------*/
 /** se definen las operaciones a realizar */
  public void display(){         //dibuja al avion en el lienzo
    imageMode(CENTER);           //establece la posicion del eje en el centro
    image(sprite,posicion.x,posicion.y);  //establece la posicion en el sprite 
    mover();  //permite moverse

  }
  public void mover(){   // permite mover al avion
    this.posicion.add(this.velocidad);         //modifica la posicion del avion con respecto a la velocidad
  }
  
 
}
