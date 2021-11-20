/** se define la clase ListaBombas */
class ListaBombas{
  
  /**Atributo de ListaBombas*/
  private ArrayList<Bomba>bombas; //crea una variable del tipo array de bombas
  private boolean band = false; //crea una variable booleana inicializada en false
  private boolean colision = false; //crea una variable booleana inicializada en false
  
  /**----Zona de contructor----*/
  
  public ListaBombas(){      //constructor por defecto
    this.bombas= new ArrayList();
    for (int i=0; i<=28;i++){ //crea una lista de bombas con 28 bombas
      Bomba b=new Bomba();
      agregarBomba(b);
    }
  }
  
  /**------------Zona de Métodos----------*/
  
  public void agregarBomba(Bomba unaBomba){      //agrega una bomba a la listaBombas
    bombas.add(unaBomba);
  }
  /** Elimina una bomba de la lista de bombas cuando
   el recorrido de una bomba llega a la parte inferior de la pantalla
   @ b: es la bomba que se evaluará si ha llegado a la parte inferior*/
  public void evaluarEliminarBomba(Bomba b, ArrayList<Explosion> explosiones, Escenario vida) {    //evalua la aeliminacion de la bomba
    this.band=false;
    if (b.getPosicion().y > height) {
      Explosion unaExplosion = new Explosion((int)b.getPosicion().x);   //crea un objeto de la clase Explosion
      explosiones.add(unaExplosion);
      bombas.remove(b); //elimina una bomba del array de bombas
      vida.setContadorVida(vida.getContadorVida() - 1);         //si hay explosion se descuenta una vida 
      this.band=true; //cambia el valor de la variable band
    }
   
  }
  
  /** Visualiza todos los disparos de la lista */
  public void displayBombas( ArrayList<Explosion> explosiones, Escenario vida, int i) { 
    Bomba b = bombas.get(i);
    b.display();
    evaluarEliminarBomba(b,explosiones, vida); //llama al método evaluarEliminarBomba()

  }
  
  
  public void validarImpacto(Dron dron) {     //evalua la colision entre dron y bomba
    for (int i=0; i<bombas.size(); i++) { //recorre la lista de bombas
      Bomba b = bombas.get(i); 
      boolean isColliding = true;
      
      if((dron.getPosicion().x+dron.getWidthFrame()-14) <= b.getPosicion().x){
        isColliding = false;
        dron.setEstado(false); //cambia el estado del avion
      }
      if(dron.getPosicion().x >= (b.getPosicion().x+b.getWidthFrame())){
        isColliding = false;
        dron.setEstado(false); //cambia el estado del avion
      }
      if((dron.getPosicion().y+dron.getHeightFrame()-38) <= b.getPosicion().y){
        isColliding = false;
        dron.setEstado(false); //cambia el estado del avion
      }
      if(dron.getPosicion().y >= (b.getPosicion().y+b.getHeightFrame())){
        isColliding = false;
        dron.setEstado(false); //cambia el estado del avion
      }

      if (isColliding) {     //verifica si existe colision
        bombas.remove(b);  //elimina una bomba
        setCont(getCont()-1);  //cambia el contador    
        escenario.setPuntaje(escenario.getPuntaje() + 1);  //suma uno al puntaje
        colision=true;
        dron.setEstado(true); //cambia el estado del dron
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
