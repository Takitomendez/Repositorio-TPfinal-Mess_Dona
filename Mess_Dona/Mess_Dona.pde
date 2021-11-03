Dron dron;
int tiempoBomba =10;
int contador=1;
private ListaBombas listaBombas;
/** Se establece la configuracion inicial*/
public void setup() {
  size(700, 700);
  dron = new Dron();
  listaBombas = new ListaBombas();
  
}
/** Se dibuja el sketch*/
public void draw() {
  background (#000000);
  dron.display();
  dron.mover();
  for(Bomba b:listaBombas.getBombas()){
    b.display();
    b.mover();
  }
  if(contador< tiempoBomba){
    if(contador==tiempoBomba){
      listaBombas.agregarBomba(new Bomba());
    }
    contador++;
  }
  else{
    contador=1;
  }
}
