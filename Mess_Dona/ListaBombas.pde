/** se define la clase */
class ListaBombas{
  /**Atributo de ListaBombas*/
  private ArrayList<Bomba>bombas;
  
  /**----Zona de contructor----*/
  
  public ListaBombas(){
    this.bombas= new ArrayList();
  }



=======
 /*public void reset(){
  bombas.size()=0;
 }*/

  public void agregarBomba(Bomba unaBomba){
    bombas.add(unaBomba);
  }
  
  public void evaluarEliminarBomba(Bomba b, ArrayList<Explosion> explosiones) {
    if (b.getPosicion().y > height) {
      Explosion unaExplosion = new Explosion((int)b.getPosicion().x);
      //unaExplosion.display();
      explosiones.add(unaExplosion);
      bombas.remove(b);
    }
  }
  
  public void displayBombas( ArrayList<Explosion> explosiones) {
    for (int i=0; i<bombas.size(); i++) {
      Bomba b = bombas.get(i);
      b.display();

      evaluarEliminarBomba(b,explosiones);
    }
  }
  
  
  public void validarImpacto(Dron dron) {
    for (int i=0; i<bombas.size(); i++) {
      Bomba b = bombas.get(i);
      

          boolean isColliding = true;
          if((dron.getPosicion().x+dron.getWidthFrame()) <= b.getPosicion().x){
   isColliding = false;
   }
   
   if(dron.getPosicion().x >= (b.getPosicion().x+b.getWidthFrame())){
   isColliding = false;
   }
   
   if((dron.getPosicion().y+dron.getHeightFrame()) <= b.getPosicion().y){
   isColliding = false;
   }
   
   if(dron.getPosicion().y >= (b.getPosicion().y+b.getHeightFrame())){
   isColliding = false;
   }

          if (isColliding) {
            bombas.remove(b);
           
          }
        }
      
    
  }
/*  public void removerBombas(){
    for(int i= bombas.size()-1;i>=0;i--){
      if(bombas.get(i).isEstado() == false){
        bombas.remove(i);
      }
    }  
  }*/
  
  
  
  public void setBombas(ArrayList<Bomba> bombas){
    this.bombas=bombas;
  }
  public ArrayList<Bomba> getBombas(){
    return this.bombas;
  }
// ver operaciones de agregar y remover
}
