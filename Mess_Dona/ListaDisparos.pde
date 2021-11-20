/** Clase que gestiona los disparos realizados*/

class ListaDisparos {
  
  private ArrayList<Disparo> disparos; //crea una variable del tipo array de disparos
  
 
/**------Zona de constructores-----------*/
  public ListaDisparos() {     //construtor por Defecto
    this.disparos = new ArrayList();
  }

  /**---------Zona de Metodos------------*/

  /** Elimina un disparo de la lista de disparos cuando
   el recorrido de un disparo llega a la parte superior de la pantalla
   @ d: es el disparo que se evaluará si ha llegado a la parte superior*/
  public void evaluarEliminarDisparo(Disparo d) { 
    if (d.getPosicion().y < 0) {
      disparos.remove(d);    
    }
  }

  /** Visualiza todos los disparos de la lista */
  public void displayDisparos() {
    for (int i=0; i<disparos.size(); i++) {
      Disparo d = disparos.get(i);
      d.display();
      evaluarEliminarDisparo(d);//llama al método evaluarEliminarDisparo()
    }
  }

  /** Verifica si un disparo colisiona con el Jefe*/
  public void validarImpacto(Jefe jefe, ArrayList<Explosion> explosiones) {
    for (int i=0; i<disparos.size(); i++) {
      Disparo d = disparos.get(i);
      // Encuentra el punto más cercano entre el disparo y el Jefe
      //crea primero este punto usando la posición del Jefe
      PVector nearestPoint = new PVector(jefe.getPosicion().x, jefe.getPosicion().y);
      // actualiza el componente x del punto más cercano a los extremos del disparo en el eje x
      if (nearestPoint.x < d.posicion.x) {
        nearestPoint.x = d.posicion.x;
      }
      if (nearestPoint.x > d.posicion.x+d.widthFrame) {
        nearestPoint.x = d.posicion.x+d.widthFrame;
      }
      // actualiza el componente y del punto más cercano a los extremos del disparo en el eje y
      if (nearestPoint.y < d.posicion.y) {
        nearestPoint.y = d.posicion.y;
      }
      if (nearestPoint.y > d.posicion.y+d.heightFrame) {
        nearestPoint.y = d.posicion.y+d.heightFrame;
      }

      float distance = nearestPoint.dist(jefe.getPosicion());// calcula la distancia

      if (distance <= jefe.getWidthFrame()/2 - 20) { //evalúa si la distancia es menor o igual a la mitad del ancho del jefe
        Explosion unaExplosion = new Explosion((int)d.getPosicion().x, (int)d.getPosicion().y-20);//crea una nueva explosión
        explosiones.add(unaExplosion);//añade una explosión a la lista de explosiones
        disparos.remove(d); //elimina un disparo
        jefe.setVida(jefe.getVida()-5); //resta la vida al jefe
      }

    }
  }


/**--------Zona de Metodos Accesores----------*/
  public ArrayList<Disparo> getDisparos() {
    return this.disparos;
  }

  public void setDisparos(ArrayList<Disparo> disparos) {
    this.disparos = disparos;
  }
}
