/** se define la clase Dispara que hereda atributos de la clase FrameObject */
class Disparo extends FrameObject{
  
  /**-----------Zona de constructores--------*/
  
  public Disparo(PVector posicion, PVector velocidad){    //establece la posicion y velocidad del disparo
    sprite = requestImage("Data/Sprites/shoot4.png");    //se carga la imagen del sprite
    this.posicion = posicion;         // se define el valor de la posicion
    this.velocidad = velocidad;      // se define el valor de la velocidad
    this.widthFrame = 172;           // se define el ancho del frame
    this.heightFrame = 250;         // se define el alto del frame
    this.posXFrame = 156*3;         // se define la posicion en x del frame
    this.posYFrame = 0;             // se define la posicion en y del frame
  }
  /**---------Zona de Metodos----------*/
  
  public void display(){                      //dibuja los disparos en el lienzo
    PImage frame = sprite.get(this.posXFrame,this.posYFrame,this.widthFrame,this.heightFrame);  // establece la posicion del frame del sprite
    frame.resize(20,50);                                        // se cambia el tamaño del frame
    imageMode(CENTER);                                        //  Alinea en el centro el texto
    image(frame,this.posicion.x,this.posicion.y);            // se establece la imagen en el lienzo
    if(this.posYFrame < sprite.height-this.heightFrame){    //permite cambiar la posicion del frame 
      posYFrame+=this.heightFrame;                         // se aumenta el valor de la posicion y del frame
    }else{
      posYFrame=0;                               //regresa al primer frame en el eje y
    }
    move();                                    // se llama al metodo move
  }
              
  public void move(){                        // cambia la posicion del disparo en el escenario
    this.posicion.add(velocidad);           //mueve la posicion con respecto a la velocidad 
  }

}
