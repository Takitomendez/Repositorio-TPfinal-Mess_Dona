Dron dron;
Escenario escenario;
int tiempoBomba =20;
int contador=1;
private ListaBombas listaBombas;
/** Se establece la configuracion inicial*/
public void setup() {
  size(1000, 700);
  dron = new Dron();
  listaBombas = new ListaBombas();
  escenario= new Escenario();
}
/** Se dibuja el sketch*/
public void draw() {
  background (#000000);
  escenario.mostrarEscenario();
  dron.display();
  dron.mover(mouseX);

  for (Bomba b : listaBombas.getBombas()) {
    b.display();
    b.mover();
  }
  if (contador<= tiempoBomba) {

    if (contador==tiempoBomba) {  
      listaBombas.agregarBomba(new Bomba());
    } 
    contador++;
  } else {
    contador=1;
  }
  dron.desarmar(listaBombas);
  listaBombas.removerBombas();
}
