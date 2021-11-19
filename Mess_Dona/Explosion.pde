class Explosion extends FrameObject{
  private int cantFrames;    //la cantidad de veces que se mostrarán frames
  private int contFrames;    //contador de frames visualizados
  private int posicionX;
  private int posicionY;

  public Explosion(int posX) {
    sprite = requestImage("Data/Sprites/explosion_bomba.png");
    widthFrame = 64;
    heightFrame = 64;
    posXFrame=0;
    posYFrame=0;
    cantFrames = 25;
    contFrames = 1;
    this.posicionX = posX;
    this.posicionY = height-heightFrame/2;
  }
  public Explosion(int posX, int posY) {
    sprite = requestImage("Data/Sprites/explosion_bomba.png");
    widthFrame = 64;
    heightFrame = 64;
    posXFrame=0;
    posYFrame=0;
    cantFrames = 25;
    contFrames = 1;
    this.posicionX = posX;
    this.posicionY = posY;
  }

  public void display() {
    imageMode(CENTER);
    if (contFrames <= cantFrames) {
      
      image(sprite.get(posXFrame, posYFrame, widthFrame, heightFrame), posicionX, posicionY);
      
      posXFrame = posXFrame + widthFrame;
      contFrames++;
      if (posXFrame >= sprite.width) {
        posXFrame=0;
        posYFrame = posYFrame+heightFrame;
      }
    }

  }
}
