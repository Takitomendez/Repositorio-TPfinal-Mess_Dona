/** se define la clase Bomba que hereda atributos de la clase FrameObject */
class Bomba extends FrameObject{ 
  
  /**------Zona de constructores--------*/
  
  public Bomba(){       //constructor por defecto
    this.sprite = loadImage("Data/Sprites/Bomba/bomba.png");  //carga la imagen desde Data
    this.posicion= new PVector(random(20,width-20),-50);//establece la posicion inicial de la bomba
    this.velocidad= new PVector(0,20);  // establece la velocidad del movimiento de la bomba
    this.widthFrame= 38;   //establece el anho del frame de la bomba
    this.heightFrame=66;   //establece elalto del frame de la bomba
    this.posXFrame=0;   // establece la posicion en x del frame
    this.posYFrame=0;  //establece la posicion en y del frame
    this.estado= true;  //establece el estado de la bomba
    sprite.resize(150,66);  // modifica el tamaño del sprite
  }
  

  /*--------Zona de operaciones-------*/
 /** se definen las operaciones a realizar */
  public void display(){  //dibuja a la bomba en el lienzo
    PImage frame = sprite.get(this.posXFrame,this.posYFrame,this.widthFrame,this.heightFrame); //establece la posicion del frame del sprite
    imageMode(CENTER); // centra la posicion en el centro de la imagen
    image(frame,this.posicion.x,this.posicion.y);  //establece la posicion del frame del sprite
    if(this.posXFrame <= sprite.width-this.widthFrame){ //permite cambiar la posicion del frame 
      posXFrame+=this.widthFrame; //cambia deframe dentro del sprite
    }else{          
      posXFrame=0;    //vuelve al primer fram
    }
    mover(); 
  }
  
  
  public void mover(){   //permite a la bomba moverse
    this.posicion.add(this.velocidad);  //mueve la posicion con respecto a la velocidad 
  }

  
  /*--------Metodos accesores---------*/
  /** se colocan los metodos accesores*/ 
  public void setEstado(boolean estado){
    this.estado=estado;
  }
  
  
}
