/**Se define la clase Explosion que hereda atributos de FrameObject*/
class Explosion extends FrameObject{
  
  /**------Atributos de la clase----------*/
  
  private int cantFrames;    //la cantidad de veces que se mostrarán frames
  private int contFrames;    //contador de frames visualizados
  private int posicionX;    // define la posicion en x
  private int posicionY;    // define la posicion en y

  
 /**------------Zona de constructores-------------*/


  public Explosion(int posX) {   //constructor parametrizado
    sprite = requestImage("Data/Sprites/explosion_bomba.png"); // carga la imagen desde Data
    widthFrame = 64;  // define el ancho del frame
    heightFrame = 64; // define el alto del frame
    posXFrame=0; // define la posicion en x del frame
    posYFrame=0; // define la posicion en y del frame
    cantFrames = 25;  //defione la cantidad de veces que se mostrarán los frames
    contFrames = 1; // cuenta la cantidad de veces que se mostraran los frames
    this.posicionX = posX; // define la posicion en x del frame
    this.posicionY = height-heightFrame/2; // define la posicion en y del frame

  }

  public Explosion(int posX, int posY) {
    sprite = requestImage("Data/Sprites/explosion_bomba.png"); // carga los Sprite de las explosiciones
    widthFrame = 64; // define el ancho del frame
    heightFrame = 64; // define el alto del frame
    posXFrame=0;  // define la posicion en x del frame
    posYFrame=0; // define la posicion en y del frame
    cantFrames = 25; //defione la cantidad de veces que se mostrarán los frames
    contFrames = 1; // cuenta la cantidad de veces que se mostraran los frames
    this.posicionX = posX; // define la posicion en x del frame
    this.posicionY = posY; // define la posicion en y del frame
  }

/**-------------Zona de Métodos------------*/
  public void display() {    //Dibuja a la explosion en el lienzo
    imageMode(CENTER); // Se centra el Sprite cargado
    if (contFrames <= cantFrames) {

      image(sprite.get(posXFrame, posYFrame, widthFrame, heightFrame), posicionX, posicionY); // Imprime el Sprite    
      posXFrame = posXFrame + widthFrame; // suma la posicion x del frame con el ancho del frame
      contFrames++; // suma el contador de los frames
      if (posXFrame >= sprite.width) {
        posXFrame=0;  // devuelve la posicion x de los frames a 0
        posYFrame = posYFrame+heightFrame; // suma la posicion y de los frames con el alto de los frames
      }
    }

  }
}
