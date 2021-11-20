
/** se define la clase Dron que hereda atributos de la clase FrameObject */
class Dron extends FrameObject {

  /* ------Zona de atributos---------*/
  private int tipo;


  /**-------- Zona de constructores------------*/
  public Dron(int tipo) {           //Constructor parametrizado
    this.sprite = loadImage("Data/Sprites/DronPrincipal/dron.png");
    this.posicion = new PVector(width/2, height-150);
    this.widthFrame = 75;
    this.heightFrame =153;
    this.posXFrame=0;
    this.posYFrame=0;
    this.tipo=tipo;
    this.estado=false;
    sprite.resize(75, 268);
  }

  
  public Dron() {  //Constructor por defecto 
    this.sprite = loadImage("Data/Sprites/DronPrincipal/dron-n2.png");
    this.posicion = new PVector(width-150, height/2);
    this.widthFrame = 105;
    this.heightFrame =51;
    this.tipo=2;
    sprite.resize(105, 51);
  }


  /*--------Zona de operaciones-------*/
  /** se definen las operaciones a realizar */


  public void display() {      //Dibuja al Dron en el Lienzo
    if (tipo==1) { //evalua que tipo de dron es y lo dibuja
      if (estado) { // evalua si el dron colisionó con alguna bomba y dibuja un frame
        imageMode(CENTER);
        PImage frame = sprite.get(this.posXFrame, this.posYFrame, this.widthFrame, this.heightFrame);
        image(frame, this.posicion.x-7, this.posicion.y-19);
      }
      if (estado==false) { // evalua si el dron NO colisionó con alguna bomba y dibuja el frame
        imageMode(CENTER);
        PImage frame = sprite.get(this.posXFrame+14, this.posYFrame+153, this.widthFrame-14, this.heightFrame-38);
        image(frame, this.posicion.x, this.posicion.y);
      }
    }
    if (tipo==3) {//evalua que tipo de dron es y lo dibuja
      imageMode(CENTER);
      PImage frame = sprite.get(this.posXFrame+14, this.posYFrame+153, this.widthFrame-14, this.heightFrame-38);
      image(frame, this.posicion.x, this.posicion.y);
    }
    if (tipo==2) {//evalua que tipo de dron es y lo dibuja

      imageMode(CENTER);
      image(this.sprite, this.posicion.x, this.posicion.y, this.widthFrame, this.heightFrame);
    }
  }


  public void mover() {    //permite al dron moverse dependiendo del tipo
    if(tipo==3){ //evalua que tipo de dron es y lo hace mover

      this.posicion.x = mouseX;
      this.posicion.y = mouseY;
    }
    if (tipo==1) {//evalua que tipo de dron es y lo hace mover
      this.posicion.x = mouseX;
    } else {
      this.posicion.y = mouseY;
    }
  }


 public void disparar(ArrayList<Disparo> disparos) {        //permite al dron realizar disparos 
    if (mousePressed && mouseButton == LEFT) {
      PVector pos = new PVector(this.posicion.x, this.posicion.y);
      Disparo disparo = new Disparo(pos, new PVector(0, -20)); //crea un nuevo disparo
      disparos.add(disparo); //agrega un disparo a la lista de disparos
      shoot.play(); //reproduce un sonido de disparo
      shoot.rewind(); //reinicia el sonido de disparo
      
    }

  }
  public void collide(Jefe jefe) {        //Evalua la colision entre circulo y rectangulo.
  
    // Encuentra el punto más cercano entre el dron y el Jefe
    //crea primero este punto usando la posición del Jefe
    PVector nearestPoint = new PVector(jefe.getPosicion().x, jefe.getPosicion().y);
    // actualiza el componente x del punto más cercano a los extremos del disparo en el eje x
    if (nearestPoint.x < this.posicion.x) {
      nearestPoint.x = this.posicion.x;
    }
    if (nearestPoint.x > this.posicion.x+this.widthFrame) {
      nearestPoint.x = this.posicion.x+this.widthFrame;
    }
    // actualiza el componente y del punto más cercano a los extremos del disparo en el eje y
    if (nearestPoint.y < this.posicion.y) {
      nearestPoint.y = this.posicion.y;
    }
    if (nearestPoint.y > this.posicion.y+this.heightFrame) {
      nearestPoint.y = this.posicion.y+this.heightFrame;
    }

    float distance = nearestPoint.dist(jefe.getPosicion()); // calcula la distancia


    if (distance <= jefe.getWidthFrame()/2) {      //verifica si existe colision
      escenario.setContadorVida(escenario.getContadorVida()-1); //resta la vida del dron
    }
  }
}
