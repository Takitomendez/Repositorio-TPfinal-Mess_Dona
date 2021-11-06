import java.util.*;
/** se define la clase */
class ListaAviones {
  private List<Avion>aviones;
  
   /**----Zona de contructor----*/
  
  public ListaAviones(){
    aviones= new ArrayList();
  }
  //ver operaciones de agregar y remover
  public void agregarAvion(Avion unAvion){
    aviones.add(unAvion);
  }
  
  public void removerAviones(){
    for(int i= aviones.size()-1;i>=0;i--){
      if(aviones.get(i).isEstado() == false){
        aviones.remove(i);
      }
    }  
  }
  
  public void setAviones(List<Avion> aviones){
    this.aviones=aviones;
  }
  public List<Avion> getAviones(){
    return this.aviones;
  }
}
