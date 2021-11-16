/** se define la clase */
class ListaBombas{
  /**Atributo de ListaBombas*/
  private List<Bomba>bombas;
  
  /**----Zona de contructor----*/
  
  public ListaBombas(){
    bombas= new ArrayList();
  }
 /*public void reset(){
  bombas.size()=0;
 }*/
  public void agregarBomba(Bomba unaBomba){
    bombas.add(unaBomba);
  }
  public void removerBombas(){
    for(int i= bombas.size()-1;i>=0;i--){
      if(bombas.get(i).isEstado() == false){
        bombas.remove(i);
      }
    }
    
  }
  
  
  
    public void setBombas(List<Bomba> bombas){
    this.bombas=bombas;
  }
  public List<Bomba> getBombas(){
    return this.bombas;
  }
// ver operaciones de agregar y remover
}
