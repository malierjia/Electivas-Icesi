public class Rueda {

  private float _posX, _posY, segmentos;
  private String nombre;
  private ArrayList <Segmento> partes;
  private PImage puntero, palitos, flechasDias, fondoDias, lunes, martes, miercoles, jueves, viernes, centroVerde;
  private boolean selBotonGuardar;
  private ArrayList <Float> horas;
  private float f=0, fEntre=0, fImpar=0;

  public Rueda(float x, float y, int s, String n) {
    _posX = x;
    _posY = y;
    segmentos = s;
    nombre = n;
    partes = new ArrayList<Segmento> ();
    horas = new ArrayList<Float> ();
    puntero = loadImage("puntero.png");
    palitos = loadImage("palitos.png");
    flechasDias = loadImage("flechasDias.png");
    fondoDias = loadImage("fondoDias.png");
    lunes = loadImage("lunes.png");
    martes = loadImage("martes.png");
    miercoles = loadImage("miercoles.png");
    jueves = loadImage("jueves.png");
    viernes = loadImage("viernes.png");
    centroVerde = loadImage("centroVerde.png");

    selBotonGuardar = false;
    circulo();
  }

  public void pintar(int mX, int mY) {
    imageMode(CORNER);    
    image(fondoDias, 0, 0); 

    for (int i=0; i<partes.size(); i++) {
      partes.get(i).pintar();
    }

    if (nombre.toLowerCase().equals("lunes")) {
      image(lunes, 110, 205);
    }
    else
      if (nombre.toLowerCase().equals("martes")) {
        image(martes, 110, 205);
      }
      else
        if (nombre.toLowerCase().equals("miercoles")) {
          image(miercoles, 110, 205);
        }
        else
          if (nombre.toLowerCase().equals("jueves")) {
            image(jueves, 110, 205);
          }
          else
            if (nombre.toLowerCase().equals("viernes")) {
              image(viernes, 110, 205);
            }

    imageMode(CENTER);
    
    botonGuardaHora();
    pushMatrix();
    translate(_posX, _posY);
    float a = atan2(mY-_posY, mX-_posX);
    rotate(a);    
    stroke(255, 0, 0);
    //image(puntero, 0, 0);    
    popMatrix();    
    //guardarHoras();
    //text(nombre, _posX, 200);
    image(centroVerde, _posX, _posY);
    imageMode(CORNER);
  }


  public void horasUsuario(String[] usuario) {
    for (int a = 0; a<usuario.length; a++) {
      if (a%2==0) {
        f= Float.parseFloat(usuario[a]);
      }
      else {
        f= Float.parseFloat(usuario[a]);
        f= f+1;
      }
      if (!horas.contains(f)) {
        horas.add(f);
      }
      else {
        horas.remove(f);
      }

      for (int b = 0; b<partes.size(); b++) {
        if (f==partes.get(b).getHora()) {
          partes.get(b).setSel(true);
        }
      }
    }
  }

  //crea circulo dividido en segmentos
  public void circulo() {    
    float angulo = 360/segmentos;
    for (float i=0; i<359; i+=angulo) {              
      partes.add(new Segmento(_posX, _posY, 310, 0, angulo, i));
    }
  }

  //dibuja el boton Guardar
  public void botonGuardaHora() {    
    noStroke();
    fill(4, 148, 102);
    ellipse(_posX, _posY, 183, 183);
    if (dist(_posX, _posY, mouseX, mouseY)<69) {
      //fill(116, 206, 178);
      fill(23, 109, 81);
    } 
    else {
      fill(23, 109, 81);
    }    
    ellipse(_posX, _posY, 139, 139);
    image(palitos, 214, 380);
  }

  //guardar horas seleccionadas
  public void guardarHoras() {    

    for (int i=0; i<partes.size(); i++) {
      if (partes.get(i).getSel()) {
        if (!horas.contains(partes.get(i).getHora())) {            
          horas.add(partes.get(i).getHora());
        }
      } 
      else {
        horas.remove(partes.get(i).getHora());
      }
    }
    println("Rueda " + nombre + ": " + horas);
    selBotonGuardar = false;
  }

  //resetea las horas y limpia el arraylist de horas
  public void borrarHoras() {
    horas.clear();
    for (int i=0; i<partes.size(); i++) {
      partes.get(i).setSel(false);
    }
    println("Todas Horas Borradas");
  }
  public void clicked(float x, float y) {
    guardarHoras();
    for (int i=0; i<partes.size(); i++) {
      partes.get(i).seleccionar(x, y);
    }
    if (dist(_posX, _posY, x, y)<69) {
      selBotonGuardar = !selBotonGuardar;
    }
  }
  public ArrayList getHoras() {
    return horas;
  }
}

