/** Clase que gestiona los disparos realizados*/
class ListaDisparos {
  private ArrayList<Disparo> disparos;

  public ListaDisparos() {
    this.disparos = new ArrayList();
  }
  /** Elimina un disparo de la lista de disparos cuando
   el recorrido llega a la parte superior de la pantalla
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

      evaluarEliminarDisparo(d);
    }
  }

  /** Verifica si hay un disparo colisiona con una nave de a flota*/
  public void validarImpacto(Jefe jefe, ArrayList<Explosion> explosiones) {
    for (int i=0; i<disparos.size(); i++) {
      Disparo d = disparos.get(i);

      boolean isColliding = false;
      // find the nearest point bettwen the rectangle and the circle
      // first this point using the position of circle
      PVector nearestPoint = new PVector(jefe.getPosicion().x, jefe.getPosicion().y);
      // update the x component of the neares point to ends of the rectangle on x axis
      if (nearestPoint.x < d.posicion.x) {
        nearestPoint.x = d.posicion.x;
      }
      if (nearestPoint.x > d.posicion.x+d.widthFrame) {
        nearestPoint.x = d.posicion.x+d.widthFrame;
      }
      // update the y component of the neares point to ends of the rectangle on y axis
      if (nearestPoint.y < d.posicion.y) {
        nearestPoint.y = d.posicion.y;
      }
      if (nearestPoint.y > d.posicion.y+d.heightFrame) {
        nearestPoint.y = d.posicion.y+d.heightFrame;
      }

      float distance = nearestPoint.dist(jefe.getPosicion());

      if (distance <= jefe.getWidthFrame()/2 - 20) {
        isColliding = true;
        Explosion unaExplosion = new Explosion((int)d.getPosicion().x, (int)d.getPosicion().y-20);
        explosiones.add(unaExplosion);
        disparos.remove(d);
        jefe.setVida(jefe.getVida()-3);
      }
    }
  }



  public ArrayList<Disparo> getDisparos() {
    return this.disparos;
  }

  public void setDisparos(ArrayList<Disparo> disparos) {
    this.disparos = disparos;
  }
}
