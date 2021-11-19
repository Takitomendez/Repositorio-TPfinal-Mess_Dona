/** se define la clase ListaBombas */
class ListaBombas{
  
  /**Atributo de ListaBombas*/
  private ArrayList<Bomba>bombas;
  private boolean band = false;
  private boolean colision = false;
  
  /**----Zona de contructor----*/
  
  public ListaBombas(){      //constructor por defecto
    this.bombas= new ArrayList();
    for (int i=0; i<=28;i++){
      Bomba b=new Bomba();
      agregarBomba(b);
    }
  }
  
  /**------------Zona de Métodos----------*/
  
  public void agregarBomba(Bomba unaBomba){      //agrega una bomba a la listaBombas
    bombas.add(unaBomba);
  }
  
  public void evaluarEliminarBomba(Bomba b, ArrayList<Explosion> explosiones, Escenario vida) {    //evalua la aeliminacion de la bomba
    this.band=false;
    if (b.getPosicion().y > height) {
      Explosion unaExplosion = new Explosion((int)b.getPosicion().x);   //crea un objeto de la clase Explosion
      explosiones.add(unaExplosion);
      bombas.remove(b);
      vida.setContadorVida(vida.getContadorVida() - 1);         //si hay explosion se descuenta una vida 
      this.band=true;
    }
   
  }
  
  public void displayBombas( ArrayList<Explosion> explosiones, Escenario vida, int i) {  //dibuja a las bombas de la lista
    Bomba b = bombas.get(i);
    b.display();
    evaluarEliminarBomba(b,explosiones, vida);

  }
  
  
  public void validarImpacto(Dron dron) {     //evalua la colision entre dron y bomba
    for (int i=0; i<bombas.size(); i++) {
      Bomba b = bombas.get(i);
      boolean isColliding = true;
      

      if((dron.getPosicion().x+dron.getWidthFrame()-14) <= b.getPosicion().x){
        isColliding = false;
        dron.setEstado(false);
      }
      if(dron.getPosicion().x >= (b.getPosicion().x+b.getWidthFrame())){
        isColliding = false;
        dron.setEstado(false);
      }
      if((dron.getPosicion().y+dron.getHeightFrame()-38) <= b.getPosicion().y){
        isColliding = false;
        dron.setEstado(true);
      }
      if(dron.getPosicion().y >= (b.getPosicion().y+b.getHeightFrame())){
        isColliding = false;
        dron.setEstado(false);
      }

      if (isColliding) {     //verifica si existe colision
        bombas.remove(b);
        setCont(getCont()-1);        
        escenario.setPuntaje(escenario.getPuntaje() + 1);  //suma uno al puntaje
        colision=true;
        dron.setEstado(true);
        }
      } 
    }

  /**-----------Zona de Metodos Accesores------------*/

  public boolean getBandera(){
    return this.band;
  }
  public boolean getColision(){
    return this.colision;
  }
  public void setBombas(ArrayList<Bomba> bombas){
    this.bombas=bombas;
  }
  public ArrayList<Bomba> getBombas(){
    return this.bombas;
  }
}
