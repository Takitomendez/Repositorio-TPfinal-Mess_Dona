//import java.util.*;
/** se define la clase */
class ListaAviones {
  private ArrayList<Avion>aviones;
  
   /**----Zona de contructor----*/
  
  public ListaAviones(){
    this.aviones= new ArrayList();
  }
  //ver operaciones de agregar y remover
  public void agregarAvion(Avion unAvion){
    aviones.add(unAvion);
  }
  
  public void evaluarEliminarAvion(Avion a, Escenario vida) {
    if (a.getPosicion().x > width) {

      aviones.remove(a);
      escenario.setPuntaje(escenario.getPuntaje()+1);
    }
  }
  
  public void displayAviones( Escenario vida) {
    for (int i=0; i<aviones.size(); i++) {
      Avion a = aviones.get(i);
      a.display();

      evaluarEliminarAvion(a,vida);
    }
  }
  
  public void validarImpacto(ArrayList<Explosion> explosiones, Dron dron) {
    for (int i=0; i<aviones.size(); i++) {
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
      
      if (isColliding) {
        aviones.remove(a);
        escenario.setContadorVida(escenario.getContadorVida()-1);
        Explosion unaExplosion = new Explosion((int)a.getPosicion().x,(int)a.getPosicion().y);
        explosiones.add(unaExplosion);
        }
      
      } 
    }
  
  public void removerAviones(){
    for(int i= aviones.size()-1;i>=0;i--){
      if(aviones.get(i).isEstado() == false){
        aviones.remove(i);
      }
    }  
  }
  
  public void setAviones(ArrayList<Avion> aviones){
    this.aviones=aviones;
  }
  public ArrayList<Avion> getAviones(){
    return this.aviones;
  }
}
