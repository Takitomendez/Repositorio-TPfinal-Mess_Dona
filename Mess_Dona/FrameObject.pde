class FrameObject extends GameObject{
  /**--------Atributos de FrameObject-------*/
  protected int posXFrame;
  protected int posYFrame;
  protected int widthFrame;
  protected int heightFrame;
  protected PImage sprite;
  /**--------- Zona de constructores---------*/
  public FrameObject(){
  }
  /**-------Zona de metodos---------*/
  public void display(){
    imageMode(CENTER);
    image(this.sprite,this.posicion.x,this.posicion.y,this.widthFrame,this.heightFrame);
    sprite.resize(61,115);

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
