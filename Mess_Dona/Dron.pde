/** se define la clase */
class Dron extends FrameObject {
  private int tipo;

  /* ------Zona de atributos---------*/
  /** Se colocan los tributos de la clase*/

  /** constructor parametrizado*/
  public Dron(int tipo) {
    this.sprite = loadImage("Data/Sprites/DronPrincipal/dron-n1.png");
    this.posicion = new PVector(width/2, height-150);
    this.widthFrame = 61;
    this.heightFrame =115;
    this.tipo=tipo;
    this.velocidad= new PVector(20, 0);
    sprite.resize(61, 115);

 //error   this.velocidad= new PVector(8, 0);

  }
  
  public Dron() {
    this.sprite = loadImage("Data/Sprites/DronPrincipal/dron-n2.png");
    this.posicion = new PVector(width-150, height/2);
    this.widthFrame = 105;
    this.heightFrame =51;
    this.tipo=2;
    sprite.resize(105, 51);


  }


  /*--------Zona de operaciones-------*/
  /** se definen las operaciones a realizar */
  public void display() {
    imageMode(CENTER);
    image(this.sprite, this.posicion.x, this.posicion.y, this.widthFrame, this.heightFrame);
//    frameRate(100);
  }

  public void mover() {
    if(tipo==3){
      this.posicion.x = mouseX;
      this.posicion.y = mouseY;
    }
    if(tipo==1){
      this.posicion.x = mouseX;
    }else{
      this.posicion.y = mouseY;
    }
  }
  
  public void disparar(ArrayList<Disparo> disparos){
    if(mousePressed && mouseButton == LEFT){
      PVector pos = new PVector(this.posicion.x,this.posicion.y);
      
      Disparo disparo = new Disparo(pos,new PVector(0,-20));
      disparos.add(disparo);
    }
  }
  
  public void collide(Jefe circle){
    boolean isColliding = false;
    // find the nearest point bettwen the rectangle and the circle
    // first this point using the position of circle
    PVector nearestPoint = new PVector(circle.getPosicion().x,circle.getPosicion().y);
    // update the x component of the neares point to ends of the rectangle on x axis 
    if(nearestPoint.x < this.posicion.x){
      nearestPoint.x = this.posicion.x;
    }
    if(nearestPoint.x > this.posicion.x+this.widthFrame){
      nearestPoint.x = this.posicion.x+this.widthFrame;
    }
    // update the y component of the neares point to ends of the rectangle on y axis
    if(nearestPoint.y < this.posicion.y){
      nearestPoint.y = this.posicion.y;
    }
    if(nearestPoint.y > this.posicion.y+this.heightFrame){
      nearestPoint.y = this.posicion.y+this.heightFrame;
    }
    
    float distance = nearestPoint.dist(circle.getPosicion());
    
    if(distance <= circle.getWidthFrame()/2){
      isColliding = true;
    }
    
  }
 
  public void devolverBomba(Bomba bomba) {

   }

  public void explotar( Avion avion) {
  }


  /*--------Metodos accesores---------*/
  /** se colocan los metodos accesores */ 
  


}
