/** se define la clase */
class Avion extends FrameObject{
  
  /**------Zona de constructores--------*/
  
  
  public Avion(){
    this.sprite = loadImage("Data/Sprites/AvionEnemigo/dron-tipo1-enemigo.png");
    this.posicion= new PVector(-50,random(20,height-20));
    this.velocidad= new PVector(7,0);
    this.widthFrame= 105;
    this.heightFrame=105;
    this.estado= true;
    this.sprite.resize(90,70);
  }
  
 /*--------Zona de operaciones-------*/
 /** se definen las operaciones a realizar */
  public void display(){
    imageMode(CENTER);
    image(sprite,posicion.x,posicion.y);
    mover();

  }
  public void mover(){
    this.posicion.add(this.velocidad);
  }
  
 
}
