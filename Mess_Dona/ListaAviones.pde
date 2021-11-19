//import java.util.*;
/** se define la clase ListaAviones*/
class ListaAviones {
  private ArrayList<Avion>aviones;
  
   /**----Zona de contructor----*/
  
  public ListaAviones(){ // constructor por defecto
    this.aviones= new ArrayList();
  }
  /**-----------Zona de métodos------------*/
  
  public void agregarAvion(Avion unAvion){ //agrega un avion a la listaAviones
    aviones.add(unAvion);
  }
  
  public void evaluarEliminarAvion(Avion a, ArrayList<Explosion> explosiones, Escenario vida) {     //elimina un avion de la listaAviones
    if (a.getPosicion().x > width) {
      Explosion unaExplosion = new Explosion((int)a.getPosicion().x);   //crea un objeto de la clase Explosion
      //unaExplosion.display();
      explosiones.add(unaExplosion);
      aviones.remove(a);
      escenario.setPuntaje(escenario.getPuntaje()+1);  //suma al puntaje 1 punto
    }
  }
  
  public void displayAviones( ArrayList<Explosion> explosiones, Escenario vida) {      //dibuja a los aviones de la lista
    for (int i=0; i<aviones.size(); i++) {
      Avion a = aviones.get(i);
      a.display();

      evaluarEliminarAvion(a,explosiones, vida);
    }
  }
  
  public void validarImpacto(Dron dron) {        // evalua la colision entre aviones y dron
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
      
      if (isColliding) {       //verifica si hay colision
        aviones.remove(a);
        escenario.setContadorVida(escenario.getContadorVida()-1);   //si existe colision se descuenta una vida
        }
      
      } 
    }
  
  public void removerAviones(){                  //elimina aviones de la lista
    for(int i= aviones.size()-1;i>=0;i--){
      if(aviones.get(i).isEstado() == false){
        aviones.remove(i);
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
