public class Materia implements Comparable<Materia> {

  private String nombre, dia, profesor, otroProfesor, doble, materiaMed, PC, departamento, nocturno, URL ;
  private int oferta, demanda, cupo, popularidad, profesorP, carrera, codigo, creditos, hI, hF, y, posY;

  private boolean sel, uno, dos, tres, cuatro, cinco, unoP, dosP, tresP, cuatroP, cincoP, matriculado;
  private PImage matricularMateria, fondoMateria, estrellaU, estrellaD, estrellaT, estrellaC, estrellaCi;
  private PFont BoldItalic, Regular, Daun;
   boolean unoF, dosF, tresF, cuatroF, cincoF; 
   private boolean demandaD, popularidadD, pPopularidad, carreraD;

  public Materia(String nombre, int codigo, int creditos, String dia, int hI, int hF, 
  String profesor, String otroProfesor, String doble, String materiaMed, String PC, 
  String departamento, String nocturno, String URL, int oferta, int demanda, int cupo, 
  int popularidad, int profesorP, int carrera, PImage fondoMateria) {

    this.nombre=nombre;
    this.dia=dia;
    this.profesor=profesor;
    this.otroProfesor=otroProfesor; 
    this.doble=doble;
    this.materiaMed=materiaMed; 
    this.PC=PC;
    this.departamento=departamento; 
    this.nocturno=nocturno;
    this.URL=URL; 
    this.oferta=oferta;
    this.demanda=demanda; 
    this.cupo=cupo;
    this.popularidad=popularidad; 
    this.profesorP=profesorP;
    this.carrera=carrera; 
    this.codigo=codigo;
    this.creditos=creditos; 
    this.hI=hI;
    this.hF=hF;
    //imagenes
    this.fondoMateria=fondoMateria;
    sel = false;
    matricularMateria = loadImage("matricularMateria.png");
    BoldItalic = loadFont("Roboto-BoldItalic-27.vlw");
    Regular = loadFont("Roboto-Regular-29.vlw");
    Daun = loadFont("DaunPenh-42.vlw");
    estrellaU = loadImage("estrella1.png");
    estrellaD = loadImage("estrella2.png");
    estrellaT = loadImage("estrella3.png");
    estrellaC = loadImage("estrella4.png");
    estrellaCi = loadImage("estrella5.png");
    matriculado = false;
  }

  public String getNombre() {
    return nombre;
  }

  public String getDia() {
    return dia;
  }
  public String getProfesor() {
    return profesor;
  }

  public String getOtroP() {
    return otroProfesor;
  }
  public String getDoble() {
    return doble;
  }
  public String getMateriaMed() {
    return materiaMed;
  }
  public String getPC() {
    return PC;
  }
  public String getDepartamento() {
    return departamento;
  }

  public String getNocturno() {
    return nocturno;
  }

  public int getHoraI() {
    return hI;
  }
  public int getHoraF() {
    return hF;
  }

  public int getDemanda() {
    return demanda;
  }
  public int getOferta() {
    return oferta;
  }

  public int getCupo() {
    return cupo;
  }
  public int getPopularidad() {
    return popularidad;
  }

  public int getProfesorP() {
    return profesorP;
  }
  public int getCarrera() {
    return carrera;
  }


  public int compareTo(Materia m) {
    return getDemanda()- m.getDemanda();
  } 

  public boolean equals(Materia m) {
    return m.getDemanda()==getDemanda();
  }

 public void pintar(int y) {
    imageMode(CENTER);
    image(fondoMateria, width/2, y);
    imageMode(CORNER);
    //this.y=y;
    fill(0);
   
   
    if (demandaD==true) {
      text(nombre, 10, y);
      text(demanda+"/"+cupo, 340, y);
      if (PC.equals("Sí")) {
        text("PC", 385, y+5);
      }
      else {
      }
    }
    else  
      if (popularidadD==true) {
      text(nombre, 10, y);
      if (PC.equals("Sí")) {
        text("PC", 385, y+5);
      }
      else {
      }
      if (popularidad==1) {
        unoF=true;
        dosF=false;
        tresF=false;
        cuatroF=false;
        cincoF=false;
      }
      else 
        if (popularidad==2) {
        unoF=false;
        dosF=true;
        tresF=false;
        cuatroF=false;
        cincoF=false;
      }
      else if (popularidad==3) {
        unoF=false;
        dosF=false;
        tresF=true;
        cuatroF=false;
        cincoF=false;
      }
      else if (popularidad==4) {
        unoF=false;
        dosF=false;
        tresF=false;
        cuatroF=true;
        cincoF=false;
      }
      else if (popularidad==5) {
        unoF=false;
        dosF=false;
        tresF=false;
        cuatroF=false;
        cincoF=true;
      }
      imageMode(CENTER);
      if (unoF==true) {

        image(estrellaU, 345, y, 30, 30);
      }
      else  if (dosF==true) {
        image(estrellaD, 345, y, 30, 30);
      }
      else  if (tresF==true) {
        image(estrellaT, 345, y, 30, 30);
      }
      else  if (cuatroF==true) {
        image(estrellaC, 345, y, 30, 30);
      }
      else  if (cincoF==true) {
        image(estrellaCi, 345, y, 30, 30);
      }

      imageMode(CORNER);
    }
    else  
      if (pPopularidad==true ) {
      text(nombre, 10, y);
      if (PC.equals("Sí")) {
        text("PC", 385, y+5);
      }
      else {
      }


      if (profesorP==1) {
        uno=true;
        dos=false;
        tres=false;
        cuatro=false;
        cinco=false;
      }
      else 
        if (profesorP==2) {
        uno=false;
        dos=true;
        tres=false;
        cuatro=false;
        cinco=false;
      }
      else if (profesorP==3) {
        uno=false;
        dos=false;
        tres=true;
        cuatro=false;
        cinco=false;
      }
      else if (profesorP==4) {
        uno=false;
        dos=false;
        tres=false;
        cuatro=true;
        cinco=false;
      }
      else if (profesorP==5) {
        uno=false;
        dos=false;
        tres=false;
        cuatro=false;
        cinco=true;
      }
      imageMode(CENTER);
      if (uno==true) {

        image(estrellaU, 345, y, 30, 30);
      }
      else  if (dos==true) {
        image(estrellaD, 345, y, 30, 30);
      }
      else  if (tres==true) {
        image(estrellaT, 345, y, 30, 30);
      }
      else  if (cuatro==true) {
        image(estrellaC, 345, y, 30, 30);
      }
      else  if (cinco==true) {
        image(estrellaCi, 345, y, 30, 30);
      }

      imageMode(CORNER);
    }
    else  
      if (carreraD==true) {
      text(nombre, 10, y);
      text(carrera, 340, y);

      if (PC.equals("Sí")) {
        text("PC", 385, y+5);
      }
      else {
      }
    }
  }

  void pintarDos() {
    if (sel==true) {
      image(matricularMateria, 0, 0); 
      fill(255);
      textFont(BoldItalic, 27);       
    //text(nombre, 60, 54, 320, 100);
      text(nombre, 60, 34, 320, 150);      
      fill(0, 66, 71);
      textFont(Regular, 23);
      //codigo
      text(codigo, 231, 180);
      //profesor
      text(profesor, 171, 271);
      //Horario
      text(dia + " " + hI + ":00-" + hF + ":00", 156, 361);
      //Creditos
      text(creditos, 271, 397);
      //demanda
      text(demanda + "/" + oferta, 247, 482);
      //popularidad
      //image();
      //profesor
      //imagen
      //carrera
      text(carrera + " estudiante(s)", 204, 631);
      //estrellas popularidad
      if (popularidad==1) {
        uno=true;
        dos=false;
        tres=false;
        cuatro=false;
        cinco=false;
      }
      else 
        if (popularidad==2) {
        uno=false;
        dos=true;
        tres=false;
        cuatro=false;
        cinco=false;
      }
      else if (popularidad==3) {
        uno=false;
        dos=false;
        tres=true;
        cuatro=false;
        cinco=false;
      }
      else if (popularidad==4) {
        uno=false;
        dos=false;
        tres=false;
        cuatro=true;
        cinco=false;
      }
      else if (popularidad==5) {
        uno=false;
        dos=false;
        tres=false;
        cuatro=false;
        cinco=true;
      }
      imageMode(CENTER);
      if (uno==true) {
        image(estrellaU, 296, 523);
      }
      else  if (dos==true) {
        image(estrellaD, 296, 523);
      }
      else  if (tres==true) {
        image(estrellaT, 296, 523);
      }
      else  if (cuatro==true) {
        image(estrellaC, 296, 523);
      }
      else  if (cinco==true) {
        image(estrellaCi, 296, 523);
      }
      //estrellas profesor
      if (profesorP==1) {
        unoP=true;
        dosP=false;
        tresP=false;
        cuatroP=false;
        cincoP=false;
      }
      else 
        if (profesorP==2) {
        unoP=false;
        dosP=true;
        tresP=false;
        cuatroP=false;
        cincoP=false;
      }
      else if (profesorP==3) {
        unoP=false;
        dosP=false;
        tresP=true;
        cuatroP=false;
        cincoP=false;
      }
      else if (profesorP==4) {
        unoP=false;
        dosP=false;
        tresP=false;
        cuatroP=true;
        cincoP=false;
      }
      else if (profesorP==5) {
        unoP=false;
        dosP=false;
        tresP=false;
        cuatroP=false;
        cincoP=true;
      }      
      if (unoP==true) {
        image(estrellaU, 282, 571);
      }
      else  if (dosP==true) {
        image(estrellaD, 282, 571);
      }
      else  if (tresP==true) {
        image(estrellaT, 282, 571);
      }
      else  if (cuatroP==true) {
        image(estrellaC, 282, 571);
      }
      else  if (cincoP==true) {
        image(estrellaCi, 282, 571);
      }
      imageMode(CORNER);
    }
  }
  public boolean seleccionar(int yy) {
    
    
    if (mouseX > 0 && mouseX < width && mouseY > yy-31 && mouseY < yy+63-30) {
      sel = true;
      return true;
    }
    else {
      sel = false;
    }

    return false;
  }
  public void setMatriculado(boolean m){
    matriculado = m;  
  }
  public boolean getMatriculado(){
    return matriculado;
  }
  public int getY() {
    return posY;
  }
  
  public boolean getSel(){
    return sel;
  }
  
    public void setDemanda(boolean d) {
    demandaD = d;
  } 
  public void setPopularidad(boolean p) {
    popularidadD = p;
  } 
  public void setPpopularidad(boolean pp) {
    pPopularidad = pp;
  } 
  public void setCarrera(boolean c) {
    carreraD = c;
  }  
}

