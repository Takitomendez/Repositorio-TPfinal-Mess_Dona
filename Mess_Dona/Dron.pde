
//import ddf.minim.*;
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

  
  public Dron() {          //Constructor por defecto 


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
    if (tipo==1) {
      if (estado) {
        imageMode(CENTER);
        PImage frame = sprite.get(this.posXFrame, this.posYFrame, this.widthFrame, this.heightFrame);
        image(frame, this.posicion.x-7, this.posicion.y-19);
      }
      if (estado==false) {
        imageMode(CENTER);
        PImage frame = sprite.get(this.posXFrame+14, this.posYFrame+153, this.widthFrame-14, this.heightFrame-38);
        image(frame, this.posicion.x, this.posicion.y);
      }
    }
    if (tipo==3) {
      imageMode(CENTER);
      PImage frame = sprite.get(this.posXFrame+14, this.posYFrame+153, this.widthFrame-14, this.heightFrame-38);
      image(frame, this.posicion.x, this.posicion.y);
    }
    if (tipo==2) {

      imageMode(CENTER);
      image(this.sprite, this.posicion.x, this.posicion.y, this.widthFrame, this.heightFrame);
    }
  }


  public void mover() {    //permite al dron moverse dependiendo del tipo
    if(tipo==3){

      this.posicion.x = mouseX;
      this.posicion.y = mouseY;
    }
    if (tipo==1) {
      this.posicion.x = mouseX;
    } else {
      this.posicion.y = mouseY;
    }
  }


 public void disparar(ArrayList<Disparo> disparos) {        //permite al dron realizar disparos 
    if (mousePressed && mouseButton == LEFT) {
      PVector pos = new PVector(this.posicion.x, this.posicion.y);
      Disparo disparo = new Disparo(pos, new PVector(0, -20));
      disparos.add(disparo);
      shoot.play();
      shoot.rewind();
      
    }

  }
  public void collide(Jefe circle) {        //Evalua la colision entre circulo y rectangulo.

    boolean isColliding = false;
    // find the nearest point bettwen the rectangle and the circle
    // first this point using the position of circle
    PVector nearestPoint = new PVector(circle.getPosicion().x, circle.getPosicion().y);
    // update the x component of the neares point to ends of the rectangle on x axis
    if (nearestPoint.x < this.posicion.x) {
      nearestPoint.x = this.posicion.x;
    }
    if (nearestPoint.x > this.posicion.x+this.widthFrame) {
      nearestPoint.x = this.posicion.x+this.widthFrame;
    }
    // update the y component of the neares point to ends of the rectangle on y axis
    if (nearestPoint.y < this.posicion.y) {
      nearestPoint.y = this.posicion.y;
    }
    if (nearestPoint.y > this.posicion.y+this.heightFrame) {
      nearestPoint.y = this.posicion.y+this.heightFrame;
    }

    float distance = nearestPoint.dist(circle.getPosicion());


    if (distance <= circle.getWidthFrame()/2) {      //verifica si existe colision

      isColliding = true;
      escenario.setContadorVida(escenario.getContadorVida()-1);
    }
  }
}
