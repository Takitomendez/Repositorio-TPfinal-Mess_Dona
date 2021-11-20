import ddf.minim.*;  //importa la biblioteca minim
import gifAnimation.*;  // importa la biblioteca 

AudioPlayer sonido;    //crea un objeto de la biblioteca AudioPlayer
AudioPlayer win;       //crea un objeto de la biblioteca AudioPlayer 
AudioPlayer gameover;  //crea un objeto de la biblioteca AudioPlayer
Minim minim;           //crea un objeto de la biblioteca Minim
AudioPlayer shoot;     // crea un objeto de la biblioteca AudioPlayer
Gif animation;        //Variable que permite realizar al animación del fondo a través de un archivo GIF. 
Gif nivel1;          //Variable que permite realizar al animación del fondo a través de un archivo GIF.
Gif nivel2;          //Variable que permite realizar al animación del fondo a través de un archivo GIF.
Gif nivel3;         //Variable que permite realizar al animación del fondo a través de un archivo GIF.
Gif gameOver;       //Variable que permite realizar al animación del fondo a través de un archivo GIF.
Dron dron;         //crea un objeto de la clase Dron
Dron dron2;        // crea un objeto de la clase dron tipo 2
Dron dron3;        // crea un objeto de la calse dron tipo 3
Escenario escenario;     //creal al objeto del escenario
ListaDisparos listDisparos;   //crea la lista de disparos
Jefe jefe;    //crea al objeto jefe



private int cont=28;               // muestra la posicion de las bombas en la listaBomba

private int estado;       //  muestra el estado de la MaquinaEstado
            
private ListaBombas listaBombas;  // crea un objeto de la clase listaBomba
ArrayList<Explosion> explosiones; // crea un Array de objetos de la clase Explosion
private ListaAviones listaAviones; // crea un objeto de la clase listaAviones




/**----------- Se establece la configuracion inicial------------*/

public void setup() {
  size(1100,762);  // define el tamaño del lienzo
  nivel1= new Gif(this,"fondo-selva.gif"); //Se carga el archivo GIF del fondo del lienzo.
  nivel1.play(); // Llama al archivo para que se dibuje
  nivel2= new Gif(this,"fondo-cielo.gif"); //Se carga el archivo GIF del fondo del lienzo.
  nivel2.play(); // Llama al archivo para que se dibuje
  nivel3= new Gif(this,"giphy.gif"); //Se carga el archivo GIF del fondo del lienzo.
  nivel3.play(); // Llama al archivo para que se dibuje
  gameOver= new Gif(this,"gameOver.gif"); //Se carga el archivo GIF del fondo del lienzo.
  gameOver.play(); // Llama al archivo para que se dibuje
  animation = new Gif(this, "malvinas3.gif"); //Se carga el archivo GIF del fondo del lienzo.
  animation.play(); // Llama al archivo para que se dibuje
  minim = new Minim(this); // Crea un nuevo Minin en la lista de sonido
  sonido = minim.loadFile("Data/music2.mp3"); // Crea la musica de fondo del juego
  win = minim.loadFile("Data/Victoria.mp3");  // Crea la musica de fondo cuando se gana el juego
  gameover = minim.loadFile("Data/Derrota.mp3"); // Crea la musica de fondo cuando se pierde en el juego
  shoot = minim.loadFile("Data/shoot.mpeg"); // Crea la musica cuando dispara el dron
  sonido.play(); // Reproduce la musica de fondo
   
  dron = new Dron(1); // Crea un nuevo tipo de dron
  dron2 = new Dron(); // Crea un nuevo tipo de dron
  dron3 = new Dron(3); // Crea un nuevo tipo de dron
  listaAviones = new ListaAviones(); // crea un objeto de la clase listaAviones
  escenario= new Escenario();    // Crea un nuevo Escenario
  estado = MaquinaEstado.Intro;  // Inicia la MaquinaEstado
  explosiones = new ArrayList(); // Crea un nuevo ArrayList
  listDisparos = new ListaDisparos(); // crea un objeto de la clase listaDisparo
  jefe = new Jefe();  // Crea un nuevo jefe
}

/** -----------Se dibuja el sketch------------*/
public void draw() { 
  
  
  if (estado==MaquinaEstado.Intro) {     //dibuja la introduccion del juego
    escenario.mostrarNivel(nivel1,estado); // Muestra el fondo del escenario 
    text("Utiliza el mouse para mover al dron",width/2,height-650); // Muestra el texto en el lienzo
    text("Pulsa ENTER para iniciar el juego", width/2, height-50); // Muestra el texto en el lienzo
    textAlign(CENTER); // Alinea en el centro el texto
    textSize(30); // Define el tamaño del texto
    fill(#FFFFFF); // Define el color del texto
  }
  if(estado==MaquinaEstado.VICTORIA || estado==MaquinaEstado.GAME_OVER){       //si se gana o se pierde la musica se detendrá
  
  sonido.pause(); // Detiene la musica de fondo
  }
  
  
  if (estado ==MaquinaEstado.Nivel_1) {                 //dibuja el contenido para el nivel 1
    escenario.mostrarNivel(nivel1,estado); // Muestra el fondo del escenario 
    escenario.mostrarPuntaje(); // Muestra el puntaje de que obtiene el dron
    escenario.mostrarVida(); // Muestra la vida del dron
    dron.display(); // Llama al metodo display de la clase dron
    dron.mover(); // Llama al metodo mover de la clase dron
    listaBombas.displayBombas(explosiones, escenario, cont); // Llama el metodo display de la clase listaBomba 
    listaBombas.validarImpacto(dron); // llama el metodo validarImpacto de la clase listaBombas
    for(int i=0;i<explosiones.size();i++){ // recorre el Array de la clase Explosiones
      Explosion e = explosiones.get(i);
      e.display(); // dibuja la explosion
    }
    if (listaBombas.getBandera()){ // evalua la condicion del atributo bandera de la Lista Bomba
      cont--; // resta el contador en 1
    }
  }
  
  if ( estado==MaquinaEstado.Nivel_2) {         // dibuja el contenido del nivel 2
    escenario.mostrarNivel(nivel2,estado); // Muestra el fondo del escenario 
    escenario.mostrarPuntaje(); // Muestra el puntaje de que obtiene el dron
    escenario.mostrarVida(); // Muestra la vida del dron
    dron2.display(); // Llama al metodo display de la clase dron
    dron2.mover(); // Llama al metodo mover de la clase dron
    listaAviones.displayAviones( escenario); // Llama el metodo display de la clase listaAviones 
    listaAviones.validarImpacto(explosiones,dron2); // llama el metodo validarImpacto de la clase listaAviones
    if(random(100)>=90){ 
      listaAviones.agregarAvion(new Avion()); // crea un nuevo avion
    }
    for(int i=0;i<explosiones.size();i++){
      Explosion e = explosiones.get(i);
      e.display(); // dibuja la explosion
    }
  }
  if(escenario.getPuntaje()==25){ // Realiza  el cambio de escenario si se cumple la condicion
   estado = 3;  // cambia el valor de la clase MaquinaEstado
  }
  if (estado==MaquinaEstado.Nivel_3) {             //dibjua el contenido para el nivel 3
    escenario.mostrarNivel(nivel3,estado); // Muestra el fondo del escenario 
    escenario.mostrarVida(); // Muestra la vida del dron
    escenario.mostrarVidaJefe(jefe); // Muestra la vida del Jefe
    jefe.display();  // Llama al metodo display de la clase Jefe
    dron3.display();  // Llama al metodo display de la clase dron
    dron3.mover(); // Llama al metodo mover de la clase dron
    dron3.disparar(listDisparos.getDisparos()); // llama el metodo disparar de la clase dron
    dron3.collide(jefe); // Llama el metodo collide de la clase dron
    listDisparos.displayDisparos(); // Llama el metodo display de la clase listaBomba 
    listDisparos.validarImpacto(jefe, explosiones); // llama el metodo validarImpacto de la clase listaDisparos
    for(int i=0;i<explosiones.size();i++){
      Explosion e = explosiones.get(i);
      e.display();
    }
  }
  if(escenario.getPuntaje()==100){ // Realiza  el cambio de escenario si se cumple la condicion
   estado=4; // cambia el valor de la clase MaquinaEstado
   escenario.setPuntaje(0); // resetea el puntaje 
  }
  
  

  if (estado ==MaquinaEstado.VICTORIA) {     //dibuja el contenido en caso de Victoria
    escenario.mostrarNivel(animation,estado); // Muestra el fondo del escenario 
    text("LAS MALVINAS SON ARGENTINAS!!!", width/2, height-80); // Muestra el texto en el lienzo
    text("Pulsa ENTER para reiniciar el juego", width/2, height-30); // Muestra el texto en el lienzo
    textAlign(CENTER); // Alinea en el centro el texto
    textSize(30);  // Define el tamaño del texto
    fill(#FFFFFF); // Define el color del texto
    cont=28; //reinicia el contador en 28
  }
  
  
  if (estado==MaquinaEstado.GAME_OVER) {    //se dibuja el contenido en caso de GameOver
    escenario.mostrarNivel(gameOver,estado); // Muestra el fondo del escenario 
    text("PERDISTE!!!", width/2, height-50);  // Muestra el texto en el lienzo
    text("Pulsa ENTER para reiniciar el juego", width/2, height-30);  // Muestra el texto en el lienzo
    textAlign(CENTER);  // Alinea en el centro el texto
    textSize(30);  // Define el tamaño del texto
    fill(#FFFFFF);  // Define el color del texto 
     
    cont=28;  //reinicia el contador en 28
  }
  if(escenario.getContadorVida()==0){  // Realiza  el cambio de escenario si se cumple la condicion
   estado=6; // cambia el valor de la clase MaquinaEstado
  gameover.play(); //Reproduce la musica de fondo
   listaBombas.getBombas().clear();  // Limpia la lista de bombas
   listaAviones.getAviones().clear(); // limpia la lista de aviones
  }
  if(jefe.getVida() <= 0){ // Realiza  el cambio de escenario si se cumple la condicion
    estado=5; // cambia el valor de la clase MaquinaEstado
    win.play(); // Reproduce la musica de fondo
  }
}


public void keyPressed() {     // establece la configuracion para el uso de teclas
  if (keyCode == ENTER && (estado == MaquinaEstado.Intro || estado == MaquinaEstado.VICTORIA || estado == MaquinaEstado.GAME_OVER)){ 
    estado = MaquinaEstado.Nivel_1; // inicia el juego en el primer nivel
    escenario.setContadorVida(3); // reinicia el contador de vida de la clase Escenario
    escenario.setPuntaje(0); // reinicia el contador de puntaje de la clase Escenario
    jefe.setVida(1040); // reinicia la vida del Jefe
    listaBombas = new ListaBombas();  // crea una nueva lista de bombas
    sonido.rewind(); // reinicia la musica de fondo
    sonido.play(); // reproduce la musica de fondo
    win.pause(); // pausea la musica de victoria
    win.rewind(); // reinicia la musica de victoria
    gameover.pause(); // pausea la musica de derrota 
    gameover.rewind(); // reinicia la musica de derrota
  }
}

/**  Metodos Accesores  */
public void setCont(int cont){
    this.cont=cont;
  }
 public int getCont(){
    return this.cont;
  }
