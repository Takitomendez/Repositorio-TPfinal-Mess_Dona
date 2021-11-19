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

          boolean existeColision = true;
          if (d.getPosicion().x> jefe.getPosicion().x-jefe.getWidthFrame()/2+jefe.getWidthFrame()) {
            existeColision = false;
          }

          if (d.getPosicion().x< jefe.getPosicion().x-jefe.getWidthFrame()/2) {
            existeColision = false;
          }

          if (d.getPosicion().y > jefe.getPosicion().y+jefe.getWidthFrame()/2) {
            existeColision = false;
          }

          if (d.getPosicion().y< jefe.getPosicion().y) {
            existeColision = false;
          }

          if (existeColision) {
    //        Explosion unaExplosion = new Explosion((int)jefe.getPosicion().x,(int)jefe.getPosicion().y);
            //unaExplosion.display();
      //      explosiones.add(unaExplosion);
            disparos.remove(d);
            jefe.setVida(jefe.getVida()-5);
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
