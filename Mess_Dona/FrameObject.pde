/**Se define la clase frameObject*/
class FrameObject extends GameObject{
  /**--------Atributos de FrameObject-------*/
  protected int posXFrame;  // define la posicion en x de los frames
  protected int posYFrame; // define la posicion en y de los frames
  protected int widthFrame; // define el ancho de los frames
  protected int heightFrame; // define el alto de los frames
  protected PImage sprite; // imprime los Sprite
  /**--------- Zona de constructores---------*/
  public FrameObject(){  //constructor por defecto
  }
  /**-------Zona de metodos---------*/
  public void display(){  // 

  }
  /**---------Metodos Accesores---------*/
  public int getPosXFrame(){
    return this.posXFrame;
  }
  public void setPosXFrame(int posXFrame){
    this.posXFrame = posXFrame;
  }
    public int getPosYFrame(){
    return this.posYFrame;
  }
  public void setPosYFrame(int posYFrame){
    this.posYFrame = posYFrame;
  }
    public int getWidthFrame(){
    return this.widthFrame;
  }
  public void setWidthFrame(int widthFrame){
    this.widthFrame = widthFrame;
  }
    public float getHeightFrame(){
    return this.heightFrame;
  }
  public void setHeigthFrame(int heightFrame){
    this.heightFrame = heightFrame;
  }
    public PImage getSprite(){
    return this.sprite;
  }
  public void setSprite(PImage sprite){
    this.sprite = sprite;
  }
}
