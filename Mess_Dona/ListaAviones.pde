
/** se define la clase ListaAviones*/
class ListaAviones {
  /**----Zona de Atributos----*/
  private ArrayList<Avion>aviones; //crea una variable del tipo array de aviones
  
   /**----Zona de contructor----*/
  
  public ListaAviones(){ // constructor por defecto
    this.aviones= new ArrayList();
  }
  /**-----------Zona de métodos------------*/
  
  public void agregarAvion(Avion unAvion){ //agrega un avion a la listaAviones
    aviones.add(unAvion);
  }
  
  /** Elimina un avion de la lista de aviones cuando
   el recorrido de un avion llega a la parte derecha de la pantalla
   @ a: es el avion que se evaluará si ha llegado a la parte derecha*/
  public void evaluarEliminarAvion(Avion a) {     //elimina un avion de la listaAviones cuando un avion sale del lienzo
    if (a.getPosicion().x > width) {
      aviones.remove(a);//elimina un avión
      escenario.setPuntaje(escenario.getPuntaje()+1);  //suma al puntaje 1 punto
    }
  }
  
  /** Visualiza todos los disparos de la lista */
  public void displayAviones() { 
    for (int i=0; i<aviones.size(); i++) { //recorre la lista de aviones
      Avion a = aviones.get(i);
      a.display(); //dibuja un avión
      evaluarEliminarAvion(a); //llama al método evaluarEliminarAvion()
    }
  }
  

  public void validarImpacto(ArrayList<Explosion> explosiones, Dron dron) {      //evalua la colision entre el dron y un avión

    for (int i=0; i<aviones.size(); i++) {// recorre la lista de aviones
      Avion a = aviones.get(i);
      boolean isColliding = true;
      
      if((dron.getPosicion().x+dron.getWidthFrame()/2) <= a.getPosicion().x){
        isColliding = false;
      }
      if(dron.getPosicion().x >= (a.getPosicion().x+a.getWidthFrame()/2)){
        isColliding = false;
      }
      if((dron.getPosicion().y+dron.getHeightFrame()) <= a.getPosicion().y){
        isColliding = false;
      }
      if(dron.getPosicion().y >= (a.getPosicion().y+a.getHeightFrame()/2)){
        isColliding = false;
      }
      
      if (isColliding) {       //verifica si hay colision
        aviones.remove(a);//elimina un avión si hay colisión
        escenario.setContadorVida(escenario.getContadorVida()-1);    //si existe colision se descuenta una vida al dron
        Explosion unaExplosion = new Explosion((int)a.getPosicion().x,(int)a.getPosicion().y);//crea una nueva explosión
        explosiones.add(unaExplosion);//añade una explosión a la lista de explosiones
        }
      } 
    }
    
  /**----------Metodos accesores-------------*/
  public void setAviones(ArrayList<Avion> aviones){
    this.aviones=aviones;
  }
  public ArrayList<Avion> getAviones(){
    return this.aviones;
  }
}
