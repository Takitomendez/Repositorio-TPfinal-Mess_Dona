Dron dron;
//new comment
Escenario escenario;
/*int tiempoBomba =20;
int contador=1;
int timePlane=100;
int cont=1;
int contPlane=1;*/
private ListaBombas listaBombas;
//private ListaAviones listaAviones;
//private ListaAviones listaAvionesB;
/** Se establece la configuracion inicial*/
public void setup() {
  size(1000, 700);
  dron = new Dron();
  listaBombas = new ListaBombas();
  escenario= new Escenario();
//  listaAviones = new ListaAviones();
//  listaAvionesB = new ListaAviones();
  
}
/** Se dibuja el sketch*/
public void draw() {
  background (#000000);
  escenario.mostrarEscenario();
  dron.display();
  dron.mover(mouseX);
  
  for(Bomba b:listaBombas.getBombas()){
 //   b.display();
    b.mover();
    dron.desarmar(b);
  }
  listaBombas.removerBombas();
  if(random(100)>=95){
    listaBombas.agregarBomba(new Bomba());
  }
//  listaBombas.removerBombas();
/*  if(contador<= tiempoBomba){

    if(contador==tiempoBomba){  
      listaBombas.agregarBomba(new Bomba());
    } 
    contador++;
  }
  else{
    contador=1;
  }*/
  
  
/**  for(Avion ab:listaAvionesB.getAviones()){
    ab.mover(false);
  }
  if(contPlane<= timePlane){

    if(contPlane==timePlane){  
      listaAvionesB.agregarAvion(new Avion());
    } 
    contPlane++;
  }
  else{
    contPlane=1;
  }
  
  for(Avion a:listaAviones.getAviones()){
    a.mover(true);
  }
  if(cont<= timePlane){

    if(cont==timePlane){  
      listaAviones.agregarAvion(new Avion( new PVector(0,50)));
    } 
    cont=cont+2;
  }
  else{
    cont=1;
  }*/
}
