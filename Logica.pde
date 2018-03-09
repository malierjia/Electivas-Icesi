public class Logica {

  //objeto clase rueda
  private Rueda rLunes;
  private Rueda rMartes;
  private Rueda rMiercoles;
  private Rueda rJueves;
  private Rueda rViernes;
  //arreglos horas dias = getHora de Rueda
  private ArrayList <Float> hLunes;
  private ArrayList <Float> hMartes;
  private ArrayList <Float> hMiercoles;
  private ArrayList <Float> hJueves;
  private ArrayList <Float> hViernes;
  private ArrayList<Estudiante> estudiantes;
  private int selHoraDia, selTipoFiltro; 

  boolean inicioLunes=true, inicialito=true;
  boolean inicioMartes=true;
  boolean inicioMiercoles=true;
  boolean inicioJueves=true;
  boolean inicioViernes=true;

  int contadorAgregaLunes=0;
  int contadorAgregaMartes=0;
  int contadorAgregaMiercoles=0;
  int contadorAgregaJueves=0;
  int contadorAgregaViernes=0;

  ////////////////////////////////
  int  offsetY = 61;
  ///////////////////////////////



  ////ESTO
  PImage seleccionLunes, seleccionMartes, seleccionMiercoles, seleccionJueves, seleccionViernes;
  //
  float horario;
  int tempLunes, temp2Lunes;
  int tempMartes, temp2Martes;
  int tempMiercoles, temp2Miercoles;
  int tempJueves, temp2Jueves;
  int tempViernes, temp2Viernes;


  private String nombre;

  private ControlP5 cp5;
  String textValue = "";

  private int y;
  private float  posX, posY;
  private int pantalla=0;

  private ArrayList<Materia> materias;
  private ArrayList<Materia> materiasLunes;
  private ArrayList<Materia> materiasMartes;
  private ArrayList<Materia> materiasMiercoles;
  private ArrayList<Materia> materiasJueves;
  private ArrayList<Materia> materiasViernes;

  private ArrayList<Materia> matriculadoLunes;
  private ArrayList<Materia> matriculadoMartes;
  private ArrayList<Materia> matriculadoMiercoles;
  private ArrayList<Materia> matriculadoJueves;
  private ArrayList<Materia> matriculadoViernes;  

  private int usuario, contrasena;
  private int fondoY=340, posYC;

  private PImage fondoMaterias, fondoMateria, resalta, login, tablaNada;
  private PImage electivasDemanda, electivasPopularidad, electivasProfesor, electivasCarrera;

  int sliderTicks2 = 0;

  private boolean lunes, martes, miercoles, jueves, viernes, sabado;


  String[] intervalosLunes;
  String[] horaIntervalosLunes;


  String[] intervalosMartes;
  String[] horaIntervalosMartes;

  String[] intervalosMiercoles;
  String[] horaIntervalosMiercoles;
  String[] intervalosJueves;
  String[] horaIntervalosJueves;
  String[] intervalosViernes;
  String[] horaIntervalosViernes;

  //excel

  private Workbook workbook;
  private Sheet[] mySheets;
  private int numeroSheet;

  //Excel2
  private Workbook workbookEstudiante;
  private Sheet[] mySheetsEstudiante;
  private int numeroSheetEstudiante;

  private IntList demandas;

  private boolean demandaP, popularidadPP, profesorP, carreraP;

  private PApplet apt;

  private PFont fuenteTitulos;

  public Logica(PApplet apt) {

    posX = 214;
    posY = 468;

    lunes = true;
    martes = false;
    miercoles = false;
    jueves = false;
    viernes = false;

    rLunes = new Rueda(posX, posY, 15, "Lunes");
    rMartes = new Rueda(posX, posY, 15, "Martes");
    rMiercoles = new Rueda(posX, posY, 15, "Miercoles");
    rJueves = new Rueda(posX, posY, 15, "Jueves");
    rViernes = new Rueda(posX, posY, 15, "Viernes");

    selHoraDia = 0;
    selTipoFiltro = 1;

    hLunes = new ArrayList<Float> ();
    hMartes = new ArrayList<Float> ();
    hMiercoles = new ArrayList<Float> ();
    hJueves = new ArrayList<Float> ();
    hViernes = new ArrayList<Float> ();
    estudiantes= new ArrayList<Estudiante>();

    this.apt=apt;

    materias=new ArrayList();
    materiasLunes=new ArrayList();
    materiasMartes=new ArrayList();
    materiasMiercoles=new ArrayList();
    materiasJueves=new ArrayList();
    materiasViernes=new ArrayList();

    //matriculadas
    matriculadoLunes = new ArrayList();
    matriculadoMartes = new ArrayList();
    matriculadoMiercoles = new ArrayList();
    matriculadoJueves = new ArrayList();
    matriculadoViernes = new ArrayList();
    //

    // this.nombre=nombre;
    fondoMaterias= loadImage("fondoMaterias.png");
    resalta= loadImage("resalta.png");
    fondoMateria=loadImage("fondoMateria.png");
    fuenteTitulos=loadFont("Dialog-48.vlw");
    login=loadImage("login.png");
    tablaNada=loadImage("tablaNada.png");

    electivasDemanda=loadImage("electivasDemanda.png");
    electivasPopularidad=loadImage("electivasPopularidad.png");
    electivasProfesor=loadImage("electivasProfesor.png");
    electivasCarrera=loadImage("electivasCarrera.png");

    ////ESTO
    seleccionLunes=loadImage("seleccionLunes.png");
    seleccionMartes=loadImage("seleccionMartes.png");
    seleccionMiercoles=loadImage("seleccionMiercoles.png");
    seleccionJueves=loadImage("seleccionJueves.png");
    seleccionViernes=loadImage("seleccionViernes.png");


    //////


    try {
      workbook = Workbook.getWorkbook(new File(dataPath("") +"/Electivas.xls"));
      mySheets = workbook.getSheets();
      int numero=  workbook.getNumberOfSheets();

      //Excel 2

      workbookEstudiante = Workbook.getWorkbook(new File(dataPath("") +"/Lista.xls"));
      mySheetsEstudiante = workbookEstudiante.getSheets();
      int numeroEstudiante=  workbookEstudiante.getNumberOfSheets();
    } 
    catch (BiffException e) {
      System.out.println("Archivo no encontrado");
    } 
    catch (IOException e) {
      System.out.println("Archivo no encontrado");
    }

    for (int i = 0; i < mySheets[numeroSheet].getRows(); i++) {
      if (i!=0) {
        int tmpCodigo= parseInt(mySheets[numeroSheet].getCell(1, i).getContents());
        int tmpCredito= parseInt(mySheets[numeroSheet].getCell(2, i).getContents());
        int tmpHi= parseInt(mySheets[numeroSheet].getCell(4, i).getContents());
        int tmpHf= parseInt(mySheets[numeroSheet].getCell(5, i).getContents());

        int tmpOferta = parseInt(mySheets[numeroSheet].getCell(14, i).getContents());
        int tmpDemanda = parseInt(mySheets[numeroSheet].getCell(15, i).getContents());
        int tempCupo = parseInt(mySheets[numeroSheet].getCell(16, i).getContents());
        int tempPopularidad = parseInt(mySheets[numeroSheet].getCell(17, i).getContents());
        int tempProfesorP = parseInt(mySheets[numeroSheet].getCell(18, i).getContents());
        int tempCarrera = parseInt(mySheets[numeroSheet].getCell(19, i).getContents());

        ////MATERIAS LUNES
        materiasLunes.add(new Materia(mySheets[numeroSheet].getCell(0, i).getContents(), 
        tmpCodigo, tmpCredito, 
        mySheets[numeroSheet].getCell(3, i).getContents(), 
        tmpHi, tmpHf, 
        mySheets[numeroSheet].getCell(6, i).getContents(), 
        mySheets[numeroSheet].getCell(7, i).getContents(), 
        mySheets[numeroSheet].getCell(8, i).getContents(), 
        mySheets[numeroSheet].getCell(9, i).getContents(), 
        mySheets[numeroSheet].getCell(10, i).getContents(), 
        mySheets[numeroSheet].getCell(11, i).getContents(), 
        mySheets[numeroSheet].getCell(12, i).getContents(), 
        mySheets[numeroSheet].getCell(13, i).getContents(), 
        tmpOferta, tmpDemanda, 
        tempCupo, 
        tempPopularidad, 
        tempProfesorP, 
        tempCarrera, 

        //imagenes
        fondoMateria
          ));

        ///MATERIAS MARTES

        materiasMartes.add(new Materia(mySheets[numeroSheet].getCell(0, i).getContents(), 
        tmpCodigo, tmpCredito, 
        mySheets[numeroSheet].getCell(3, i).getContents(), 
        tmpHi, tmpHf, 
        mySheets[numeroSheet].getCell(6, i).getContents(), 
        mySheets[numeroSheet].getCell(7, i).getContents(), 
        mySheets[numeroSheet].getCell(8, i).getContents(), 
        mySheets[numeroSheet].getCell(9, i).getContents(), 
        mySheets[numeroSheet].getCell(10, i).getContents(), 
        mySheets[numeroSheet].getCell(11, i).getContents(), 
        mySheets[numeroSheet].getCell(12, i).getContents(), 
        mySheets[numeroSheet].getCell(13, i).getContents(), 
        tmpOferta, tmpDemanda, 
        tempCupo, 
        tempPopularidad, 
        tempProfesorP, 
        tempCarrera, 

        //imagenes
        fondoMateria
          ));

        ///MATERIAS MIERCOLES

        materiasMiercoles.add(new Materia(mySheets[numeroSheet].getCell(0, i).getContents(), 
        tmpCodigo, tmpCredito, 
        mySheets[numeroSheet].getCell(3, i).getContents(), 
        tmpHi, tmpHf, 
        mySheets[numeroSheet].getCell(6, i).getContents(), 
        mySheets[numeroSheet].getCell(7, i).getContents(), 
        mySheets[numeroSheet].getCell(8, i).getContents(), 
        mySheets[numeroSheet].getCell(9, i).getContents(), 
        mySheets[numeroSheet].getCell(10, i).getContents(), 
        mySheets[numeroSheet].getCell(11, i).getContents(), 
        mySheets[numeroSheet].getCell(12, i).getContents(), 
        mySheets[numeroSheet].getCell(13, i).getContents(), 
        tmpOferta, tmpDemanda, 
        tempCupo, 
        tempPopularidad, 
        tempProfesorP, 
        tempCarrera, 

        //imagenes
        fondoMateria
          ));

        ///MATERIAS JUEVES

        materiasJueves.add(new Materia(mySheets[numeroSheet].getCell(0, i).getContents(), 
        tmpCodigo, tmpCredito, 
        mySheets[numeroSheet].getCell(3, i).getContents(), 
        tmpHi, tmpHf, 
        mySheets[numeroSheet].getCell(6, i).getContents(), 
        mySheets[numeroSheet].getCell(7, i).getContents(), 
        mySheets[numeroSheet].getCell(8, i).getContents(), 
        mySheets[numeroSheet].getCell(9, i).getContents(), 
        mySheets[numeroSheet].getCell(10, i).getContents(), 
        mySheets[numeroSheet].getCell(11, i).getContents(), 
        mySheets[numeroSheet].getCell(12, i).getContents(), 
        mySheets[numeroSheet].getCell(13, i).getContents(), 
        tmpOferta, tmpDemanda, 
        tempCupo, 
        tempPopularidad, 
        tempProfesorP, 
        tempCarrera, 

        //imagenes
        fondoMateria
          ));

        ///MATERIAS VIERNES

        materiasViernes.add(new Materia(mySheets[numeroSheet].getCell(0, i).getContents(), 
        tmpCodigo, tmpCredito, 
        mySheets[numeroSheet].getCell(3, i).getContents(), 
        tmpHi, tmpHf, 
        mySheets[numeroSheet].getCell(6, i).getContents(), 
        mySheets[numeroSheet].getCell(7, i).getContents(), 
        mySheets[numeroSheet].getCell(8, i).getContents(), 
        mySheets[numeroSheet].getCell(9, i).getContents(), 
        mySheets[numeroSheet].getCell(10, i).getContents(), 
        mySheets[numeroSheet].getCell(11, i).getContents(), 
        mySheets[numeroSheet].getCell(12, i).getContents(), 
        mySheets[numeroSheet].getCell(13, i).getContents(), 
        tmpOferta, tmpDemanda, 
        tempCupo, 
        tempPopularidad, 
        tempProfesorP, 
        tempCarrera, 

        //imagenes
        fondoMateria
          ));
      }
    }
    //////////////////////////////////////////EXCEL DOS

    for (int i = 0; i < mySheetsEstudiante[numeroSheetEstudiante].getRows(); i++) {
      if (i!=0) {
        //int tmpCodigo= parseInt(mySheetsEstudiante[numeroSheetEstudiante].getCell(2, i).getContents());
        int tmpPC= parseInt(mySheetsEstudiante[numeroSheetEstudiante].getCell(4, i).getContents());

        ////ESTUDIANTE
        estudiantes.add(new Estudiante(mySheetsEstudiante[numeroSheetEstudiante].getCell(0, i).getContents(), 
        mySheetsEstudiante[numeroSheetEstudiante].getCell(1, i).getContents(), 
        mySheetsEstudiante[numeroSheetEstudiante].getCell(2, i).getContents(), mySheetsEstudiante[numeroSheetEstudiante].getCell(3, i).getContents(), 
        tmpPC, mySheetsEstudiante[numeroSheetEstudiante].getCell(5, i).getContents(), 
        //
        mySheetsEstudiante[numeroSheetEstudiante].getCell(6, i).getContents(), 
        mySheetsEstudiante[numeroSheetEstudiante].getCell(7, i).getContents(), 
        mySheetsEstudiante[numeroSheetEstudiante].getCell(8, i).getContents(), 
        mySheetsEstudiante[numeroSheetEstudiante].getCell(9, i).getContents()
          //

        ));
      }
    }

    //////////////////////////////FIN EXCEL DOS

    PFont font = createFont("arial", 20);
    cp5 = new ControlP5(apt);

    cp5.addTextfield("usuario")
      .setPosition(86, 405)
        .setSize(255, 56)
          .setFont(font)
            .setFocus(true)
              .setColor(color(23, 109, 81))
                .setAutoClear(false)
                  .setCaptionLabel("")
                    .setColorBackground(color(255))
                      .setColorCursor(color(0))
                        ;
  }

  public String getNombre() {
    return nombre;
  }

  public void control () {    
    if (keyCode==ENTER) {
      pantalla=1;
    }
  }

  public void controlEvento(ControlEvent theEvent) {
    if (theEvent.isAssignableFrom(Textfield.class)) {
      println("controlEvent: accessing a string from controller '"
        +theEvent.getName()+"': "
        +theEvent.getStringValue()
        );
    }
  }

  public void pintar() {
    switch(pantalla) {
    case 0:
      image(login, 0, 0);
      break;
    case 1:
      image(tablaNada, 0, 0);
      cp5.get(Textfield.class, "usuario").hide();

      ////////////////////////////////////////////////////

      for (int i=0; i<estudiantes.size(); i++) {  
        if (cp5.get(Textfield.class, "usuario").getText().equals(estudiantes.get(i).getCodigo())) {  

          ////Lunes
          if (estudiantes.get(i).getLunes().equals("0") || estudiantes.get(i).getLunes().isEmpty()) {
          }
          else {
            String horarioLunes=estudiantes.get(i).getLunes();
            intervalosLunes = split(horarioLunes, ',');
            for (int j=0; j<intervalosLunes.length; j++) {

              horaIntervalosLunes = split(intervalosLunes[j], '-');

              for (int x=0; x<horaIntervalosLunes.length;x++) {

                float f= Float.parseFloat(horaIntervalosLunes[x]);
                hLunes.add(f);
                contadorAgregaLunes++;

                if (inicioLunes==true) {
                  tempLunes=Integer.parseInt(horaIntervalosLunes[0]);
                  temp2Lunes=Integer.parseInt(horaIntervalosLunes[1]);

                  while (tempLunes<=temp2Lunes) {
                    String[] temporalEntreLunes=new String[temp2Lunes-tempLunes];
                    for (int l=0; l<temporalEntreLunes.length;l++) {

                      temporalEntreLunes[l] = tempLunes+"";
                    }
                    rLunes.horasUsuario(temporalEntreLunes);
                    tempLunes++;
                  }
                }

                if (contadorAgregaLunes==horaIntervalosLunes.length*intervalosLunes.length) {
                  inicioLunes=false;
                }
              }
            }
          }


          //FIN LUNES

          ////MARTES
          if (estudiantes.get(i).getMartes().equals("0") || estudiantes.get(i).getMartes().isEmpty()) {
          }
          else {
            String horarioMartes=estudiantes.get(i).getMartes();
            intervalosMartes = split(horarioMartes, ',');
            for (int j=0; j<intervalosMartes.length; j++) {

              horaIntervalosMartes = split(intervalosMartes[j], '-');

              for (int x=0; x<horaIntervalosMartes.length;x++) {
                float f= Float.parseFloat(horaIntervalosMartes[x]);

                hMartes.add(f);
                contadorAgregaMartes++;

                if (inicioMartes==true) {
                  tempMartes=Integer.parseInt(horaIntervalosMartes[0]);
                  temp2Martes=Integer.parseInt(horaIntervalosMartes[1]);

                  while (tempMartes<=temp2Martes) {
                    String[] temporalEntreMartes=new String[temp2Martes-tempMartes];
                    for (int l=0; l<temporalEntreMartes.length;l++) {

                      temporalEntreMartes[l] = tempMartes+"";
                    }
                    rMartes.horasUsuario(temporalEntreMartes);
                    tempMartes++;
                  }
                }

                if (contadorAgregaMartes==horaIntervalosMartes.length*intervalosMartes.length) {
                  inicioMartes=false;
                }
              }
            }
          }
          //FIN MARTES


          ////Miercoles
          if (estudiantes.get(i).getMiercoles().equals("0") || estudiantes.get(i).getMiercoles().isEmpty()) {
          }
          else {
            String horarioMiercoles=estudiantes.get(i).getMiercoles();
            intervalosMiercoles = split(horarioMiercoles, ',');
            for (int j=0; j<intervalosMiercoles.length; j++) {

              horaIntervalosMiercoles = split(intervalosMiercoles[j], '-');

              for (int x=0; x<horaIntervalosMiercoles.length;x++) {
                float f= Float.parseFloat(horaIntervalosMiercoles[x]);

                hMiercoles.add(f);
                contadorAgregaMiercoles++;

                if (inicioMiercoles==true) {
                  tempMiercoles=Integer.parseInt(horaIntervalosMiercoles[0]);
                  //arrayIndexOutOfBounds Exception
                  temp2Miercoles=Integer.parseInt(horaIntervalosMiercoles[1]);

                  while (tempMiercoles<=temp2Miercoles) {
                    String[] temporalEntreMiercoles=new String[temp2Miercoles-tempMiercoles];
                    for (int l=0; l<temporalEntreMiercoles.length;l++) {

                      temporalEntreMiercoles[l] = tempMiercoles+"";
                    }
                    rMiercoles.horasUsuario(temporalEntreMiercoles);
                    tempMiercoles++;
                  }
                }

                if (contadorAgregaMiercoles==horaIntervalosMiercoles.length*intervalosMiercoles.length) {
                  inicioMiercoles=false;
                }
              }
            }
          }
          //FIN Miercoles

          ////Miercoles
          if (estudiantes.get(i).getJueves().equals("0") || estudiantes.get(i).getJueves().isEmpty()) {
          }
          else {
            String horarioJueves=estudiantes.get(i).getJueves();
            intervalosJueves = split(horarioJueves, ',');
            for (int j=0; j<intervalosJueves.length; j++) {

              horaIntervalosJueves = split(intervalosJueves[j], '-');

              for (int x=0; x<horaIntervalosJueves.length;x++) {
                float f= Float.parseFloat(horaIntervalosJueves[x]);

                hJueves.add(f);
                contadorAgregaJueves++;

                if (inicioJueves==true) {
                  tempJueves=Integer.parseInt(horaIntervalosJueves[0]);
                  temp2Jueves=Integer.parseInt(horaIntervalosJueves[1]);

                  while (tempJueves<=temp2Jueves) {
                    String[] temporalEntreJueves=new String[temp2Jueves-tempJueves];
                    for (int l=0; l<temporalEntreJueves.length;l++) {

                      temporalEntreJueves[l] = tempJueves+"";
                    }
                    rJueves.horasUsuario(temporalEntreJueves);
                    tempJueves++;
                  }
                }

                if (contadorAgregaJueves==horaIntervalosJueves.length*intervalosJueves.length) {
                  inicioJueves=false;
                }
              }
            }
          }

          //FIN Jueves

          ////Viernes
          if (estudiantes.get(i).getViernes().equals("0")  || estudiantes.get(i).getViernes().isEmpty()) {
          }
          else {
            String horarioViernes=estudiantes.get(i).getViernes();
            intervalosViernes = split(horarioViernes, ',');
            for (int j=0; j<intervalosViernes.length; j++) {

              horaIntervalosViernes = split(intervalosViernes[j], '-');

              for (int x=0; x<horaIntervalosViernes.length;x++) {
                float f= Float.parseFloat(horaIntervalosViernes[x]);

                hViernes.add(f);
                contadorAgregaViernes++;

                if (inicioViernes==true) {
                  tempViernes=Integer.parseInt(horaIntervalosViernes[0]);
                  temp2Viernes=Integer.parseInt(horaIntervalosViernes[1]);

                  while (tempViernes<=temp2Viernes) {
                    String[] temporalEntreViernes=new String[temp2Viernes-tempViernes];
                    for (int l=0; l<temporalEntreViernes.length;l++) {

                      temporalEntreViernes[l] = tempViernes+"";
                    }
                    rViernes.horasUsuario(temporalEntreViernes);
                    tempViernes++;
                  }
                }

                if (contadorAgregaViernes==horaIntervalosViernes.length*intervalosViernes.length) {
                  inicioViernes=false;
                }
              }
            }
          }
          //FIN Viernes
        }
      }

      if (inicialito==true) {
        rLunes.guardarHoras();        
        rMartes.guardarHoras();
        rMiercoles.guardarHoras();
        rJueves.guardarHoras();
        rViernes.guardarHoras();
        inicialito=false;
      }

      ///PROVISIONAL
      if (keyPressed) {
        pantalla=2;
      }
      ///FIN PROVISIONAL
      for(int m=0; m<matriculadoLunes.size(); m++){
        matriculadoLunes.get(m).pintar(70+(67*m));
      }
      for(int m=0; m<matriculadoMartes.size(); m++){
        matriculadoMartes.get(m).pintar(193+(67*m));
      }
      for(int m=0; m<matriculadoMiercoles.size(); m++){
        matriculadoMiercoles.get(m).pintar(319+(67*m));
      }
      for(int m=0; m<matriculadoJueves.size(); m++){
        matriculadoJueves.get(m).pintar(445+(67*m));
      }
      for(int m=0; m<matriculadoViernes.size(); m++){
        matriculadoViernes.get(m).pintar(571+(67*m));
      }
      /////////////////////////////////////////////////////////////////////////////////////////////////////
      break;

    case 2:      
      //crear switch para cambiar entre ruedas.dias
      switch(selHoraDia) {
      case 0: //lunes
        rLunes.pintar(mouseX, mouseY);    
        break;
      case 1: //martes
        rMartes.pintar(mouseX, mouseY);        
        break;
      case 2: //miercoles
        rMiercoles.pintar(mouseX, mouseY);        
        break;
      case 3: //jueves
        rJueves.pintar(mouseX, mouseY);        
        break;
      case 4: //viernes
        rViernes.pintar(mouseX, mouseY);        
        break;
      }//fin switch selHoraDia

      fill(0);

      text(cp5.get(Textfield.class, "usuario").getText(), 360, 130);
      usuario=parseInt(cp5.get(Textfield.class, "usuario").getText());

      break;

    case 3:  



      //crear switch para cambiar entre ruedas.dias
      switch(selTipoFiltro) {
      case 0: //Hora
        if (lunes==true) {
          Collections.sort(materiasLunes, new ClaseComparatorHora());
        }
        else if (martes==true) {
          Collections.sort(materiasMartes, new ClaseComparatorHora());
        }
        else if (miercoles==true) {
          Collections.sort(materiasMiercoles, new ClaseComparatorHora());
        }
        else if (jueves==true) {
          Collections.sort(materiasJueves, new ClaseComparatorHora());
        }
        else if (viernes==true) {
          Collections.sort(materiasViernes, new ClaseComparatorHora());
        }
        demandaP=false;
        popularidadPP=false;
        profesorP=false;
        carreraP=false;  
        break;
      case 1: //Demanda
        if (lunes==true) {
          Collections.sort(materiasLunes, new ClaseComparatorMateriaDemanda());
        }
        else if (martes==true) {
          Collections.sort(materiasMartes, new ClaseComparatorMateriaDemanda());
        }
        else if (miercoles==true) {
          Collections.sort(materiasMiercoles, new ClaseComparatorMateriaDemanda());
        }
        else if (jueves==true) {
          Collections.sort(materiasJueves, new ClaseComparatorMateriaDemanda());
        }
        else if (viernes==true) {
          Collections.sort(materiasViernes, new ClaseComparatorMateriaDemanda());
        }
        demandaP=true;
        popularidadPP=false;
        profesorP=false;
        carreraP=false;        
        break;
      case 2: //Popularidad
        if (lunes==true) { 
          Collections.sort(materiasLunes, new ClaseComparatorPopularidad());
        }
        else if (martes==true) { 
          Collections.sort(materiasMartes, new ClaseComparatorPopularidad());
        }
        else if (miercoles==true) { 
          Collections.sort(materiasMiercoles, new ClaseComparatorPopularidad());
        }
        else if (jueves==true) { 
          Collections.sort(materiasJueves, new ClaseComparatorPopularidad());
        }
        else if (viernes==true) { 
          Collections.sort(materiasViernes, new ClaseComparatorPopularidad());
        }

        demandaP=false;
        popularidadPP=true;
        profesorP=false;
        carreraP=false;       
        break;
      case 3: //Profesor
        if (lunes==true) { 
          Collections.sort(materiasLunes, new ClaseComparatorProfesor());
        }
        else if (martes==true) { 
          Collections.sort(materiasMartes, new ClaseComparatorProfesor());
        }
        else if (miercoles==true) { 
          Collections.sort(materiasMiercoles, new ClaseComparatorProfesor());
        }
        else if (jueves==true) { 
          Collections.sort(materiasJueves, new ClaseComparatorProfesor());
        }
        else if (viernes==true) { 
          Collections.sort(materiasViernes, new ClaseComparatorProfesor());
        }

        demandaP=false;
        popularidadPP=false;
        profesorP=true;
        carreraP=false;       
        break;
      case 4: //Carrera
        if (lunes==true) { 
          Collections.sort(materiasLunes, new ClaseComparatorCarrera());
        }
        else if (martes==true) { 
          Collections.sort(materiasMartes, new ClaseComparatorCarrera());
        }
        else if (miercoles==true) { 
          Collections.sort(materiasMiercoles, new ClaseComparatorCarrera());
        }
        else if (jueves==true) { 
          Collections.sort(materiasJueves, new ClaseComparatorCarrera());
        }
        else if (viernes==true) { 
          Collections.sort(materiasViernes, new ClaseComparatorCarrera());
        }
        demandaP=false;
        popularidadPP=false;
        profesorP=false;
        carreraP=true;       
        break;
      }//fin switch selHoraDia


      //cambie horas por hLunes, hMartes, hMiercoles... para cada día.
      //pinta la lista de materias de cada dìa
      if (lunes==true) {
        for (int i = 0; i < materiasLunes.size(); i++) {
          if (i!=0) {
            if (materiasLunes.get(i).getMatriculado()==true) {
              materiasLunes.remove(i);
            }
            materiasLunes.get(i).pintar(fondoY+(i * offsetY));
          }
        }

        for (int j=0; j<hLunes.size();j++) {
          for (int i=0; i<materiasLunes.size();i++) {
            if (i!=0) {


              if ((materiasLunes.get(i).getHoraI()>hLunes.get(j) &&
                materiasLunes.get(i).getHoraI()>=hLunes.get(j)) ||  
                (materiasLunes.get(i).getHoraF()<=hLunes.get(j) &&
                materiasLunes.get(i).getHoraF()<hLunes.get(j)) ) 
              {
                if (materiasLunes.get(i).getDia().equals("Lunes")) {
                }
                else {
                  materiasLunes.remove(i);
                }
              }
              else {
                materiasLunes.remove(i);
              }
            }
          }
        }
      }
      else if (martes==true) {

        for (int i = 0; i < materiasMartes.size(); i++) {
          if (i!=0) {

            if (materiasMartes.get(i).getMatriculado()==true) {
              materiasMartes.remove(i);
            }

            materiasMartes.get(i).pintar(fondoY+(i * offsetY));
          }
        }

        for (int j=0; j<hMartes.size();j++) {
          for (int i=0; i<materiasMartes.size();i++) {
            if (i!=0) {

              if ((materiasMartes.get(i).getHoraI()>hMartes.get(j) &&
                materiasMartes.get(i).getHoraI()>=hMartes.get(j)) ||  
                (materiasMartes.get(i).getHoraF()<=hMartes.get(j) &&
                materiasMartes.get(i).getHoraF()<hMartes.get(j)) ) 

              {

                if (materiasMartes.get(i).getDia().equals("Martes")) {
                }
                else {
                  materiasMartes.remove(i);
                }
              }
              else {
                materiasMartes.remove(i);
              }
            }
          }
        }
      }
      else if (miercoles==true) {
        for (int i = 0; i < materiasMiercoles.size(); i++) {
          if (i!=0) {

            if (materiasMiercoles.get(i).getMatriculado()==true) {
              materiasMiercoles.remove(i);
            }
            materiasMiercoles.get(i).pintar(fondoY+(i * offsetY));
          }
        }

        for (int j=0; j<hMiercoles.size();j++) {
          for (int i=0; i<materiasMiercoles.size();i++) {
            if (i!=0) {
              if ((materiasMiercoles.get(i).getHoraI()>hMiercoles.get(j) &&
                materiasMiercoles.get(i).getHoraI()>=hMiercoles.get(j)) ||  
                (materiasMiercoles.get(i).getHoraF()<=hMiercoles.get(j) &&
                materiasMiercoles.get(i).getHoraF()<hMiercoles.get(j)) ) 

              {
                if (materiasMiercoles.get(i).getDia().equals("Miercoles")) {
                }
                else {
                  materiasMiercoles.remove(i);
                }
              }
              else {
                materiasMiercoles.remove(i);
              }
            }
          }
        }
      }
      else if (jueves==true) {
        for (int i = 0; i < materiasJueves.size(); i++) {
          if (i!=0) {
            if (materiasJueves.get(i).getMatriculado()==true) {
              materiasJueves.remove(i);
            }
            materiasJueves.get(i).pintar(fondoY+(i * offsetY));
          }
        }
        for (int j=0; j<hJueves.size();j++) {
          for (int i=0; i<materiasJueves.size();i++) {
            if (i!=0) {
              if ((materiasJueves.get(i).getHoraI()>hJueves.get(j) &&
                materiasJueves.get(i).getHoraI()>=hJueves.get(j)) ||  
                (materiasJueves.get(i).getHoraF()<=hJueves.get(j) &&
                materiasJueves.get(i).getHoraF()<hJueves.get(j)) )

              {
                if (materiasJueves.get(i).getDia().equals("Jueves")) {
                }
                else {
                  materiasJueves.remove(i);
                }
              }
              else {
                materiasJueves.remove(i);
              }
            }
          }
        }
      }
      else if (viernes=true) {
        for (int i = 0; i < materiasViernes.size(); i++) {
          if (i!=0) {
            if (materiasViernes.get(i).getMatriculado()==true) {
              materiasViernes.remove(i);
            }
            materiasViernes.get(i).pintar(fondoY+(i * offsetY));
          }
        }
        for (int j=0; j<hViernes.size();j++) {
          for (int i=0; i<materiasViernes.size();i++) {
            if (i!=0) {
              if ((materiasViernes.get(i).getHoraI()>hViernes.get(j) &&
                materiasViernes.get(i).getHoraI()>=hViernes.get(j)) ||  
                (materiasViernes.get(i).getHoraF()<=hViernes.get(j) &&
                materiasViernes.get(i).getHoraF()<hViernes.get(j)) ) 

              {
                if (materiasViernes.get(i).getDia().equals("Viernes")) {
                }
                else {
                  materiasViernes.remove(i);
                }
              }
              else {
                materiasViernes.remove(i);
              }
            }
          }
        }
      }

      if (demandaP==true) {
        image(electivasDemanda, 0, 0);

        for (int i=0; i<materiasLunes.size();i++) {
          materiasLunes.get(i).setDemanda(true);
        }

        for (int i=0; i<materiasMartes.size();i++) {
          materiasMartes.get(i).setDemanda(true);
        }
        for (int i=0; i<materiasMiercoles.size();i++) {
          materiasMiercoles.get(i).setDemanda(true);
        }
        for (int i=0; i<materiasJueves.size();i++) {
          materiasJueves.get(i).setDemanda(true);
        }
        for (int i=0; i<materiasViernes.size();i++) {
          materiasViernes.get(i).setDemanda(true);
        }

        ///
        for (int i=0; i<materiasLunes.size();i++) {
          materiasLunes.get(i).setPopularidad(false);
        }

        for (int i=0; i<materiasMartes.size();i++) {
          materiasMartes.get(i).setPopularidad(false);
        }
        for (int i=0; i<materiasMiercoles.size();i++) {
          materiasMiercoles.get(i).setPopularidad(false);
        }
        for (int i=0; i<materiasJueves.size();i++) {
          materiasJueves.get(i).setPopularidad(false);
        }
        for (int i=0; i<materiasViernes.size();i++) {
          materiasViernes.get(i).setPopularidad(false);
        }

        //
        for (int i=0; i<materiasLunes.size();i++) {
          materiasLunes.get(i).setPpopularidad(false);
        }

        for (int i=0; i<materiasMartes.size();i++) {
          materiasMartes.get(i).setPpopularidad(false);
        }
        for (int i=0; i<materiasMiercoles.size();i++) {
          materiasMiercoles.get(i).setPpopularidad(false);
        }
        for (int i=0; i<materiasJueves.size();i++) {
          materiasJueves.get(i).setPpopularidad(false);
        }
        for (int i=0; i<materiasViernes.size();i++) {
          materiasViernes.get(i).setPpopularidad(false);
        }
        //
        for (int i=0; i<materiasLunes.size();i++) {
          materiasLunes.get(i).setCarrera(false);
        }

        for (int i=0; i<materiasMartes.size();i++) {
          materiasMartes.get(i).setCarrera(false);
        }
        for (int i=0; i<materiasMiercoles.size();i++) {
          materiasMiercoles.get(i).setCarrera(false);
        }
        for (int i=0; i<materiasJueves.size();i++) {
          materiasJueves.get(i).setCarrera(false);
        }
        for (int i=0; i<materiasViernes.size();i++) {
          materiasViernes.get(i).setCarrera(false);
        }
      }
      else if (popularidadPP==true) {
        image(electivasPopularidad, 0, 0);

        for (int i=0; i<materiasLunes.size();i++) {
          materiasLunes.get(i).setDemanda(false);
        }

        for (int i=0; i<materiasMartes.size();i++) {
          materiasMartes.get(i).setDemanda(false);
        }
        for (int i=0; i<materiasMiercoles.size();i++) {
          materiasMiercoles.get(i).setDemanda(false);
        }
        for (int i=0; i<materiasJueves.size();i++) {
          materiasJueves.get(i).setDemanda(false);
        }
        for (int i=0; i<materiasViernes.size();i++) {
          materiasViernes.get(i).setDemanda(false);
        }

        ///
        for (int i=0; i<materiasLunes.size();i++) {
          materiasLunes.get(i).setPopularidad(true);
        }

        for (int i=0; i<materiasMartes.size();i++) {
          materiasMartes.get(i).setPopularidad(true);
        }
        for (int i=0; i<materiasMiercoles.size();i++) {
          materiasMiercoles.get(i).setPopularidad(true);
        }
        for (int i=0; i<materiasJueves.size();i++) {
          materiasJueves.get(i).setPopularidad(true);
        }
        for (int i=0; i<materiasViernes.size();i++) {
          materiasViernes.get(i).setPopularidad(true);
        }

        //
        for (int i=0; i<materiasLunes.size();i++) {
          materiasLunes.get(i).setPpopularidad(false);
        }

        for (int i=0; i<materiasMartes.size();i++) {
          materiasMartes.get(i).setPpopularidad(false);
        }
        for (int i=0; i<materiasMiercoles.size();i++) {
          materiasMiercoles.get(i).setPpopularidad(false);
        }
        for (int i=0; i<materiasJueves.size();i++) {
          materiasJueves.get(i).setPpopularidad(false);
        }
        for (int i=0; i<materiasViernes.size();i++) {
          materiasViernes.get(i).setPpopularidad(false);
        }
        //
        for (int i=0; i<materiasLunes.size();i++) {
          materiasLunes.get(i).setCarrera(false);
        }

        for (int i=0; i<materiasMartes.size();i++) {
          materiasMartes.get(i).setCarrera(false);
        }
        for (int i=0; i<materiasMiercoles.size();i++) {
          materiasMiercoles.get(i).setCarrera(false);
        }
        for (int i=0; i<materiasJueves.size();i++) {
          materiasJueves.get(i).setCarrera(false);
        }
        for (int i=0; i<materiasViernes.size();i++) {
          materiasViernes.get(i).setCarrera(false);
        }
      }
      else if (profesorP==true) {
        image(electivasProfesor, 0, 0);

        for (int i=0; i<materiasLunes.size();i++) {
          materiasLunes.get(i).setDemanda(false);
        }

        for (int i=0; i<materiasMartes.size();i++) {
          materiasMartes.get(i).setDemanda(false);
        }
        for (int i=0; i<materiasMiercoles.size();i++) {
          materiasMiercoles.get(i).setDemanda(false);
        }
        for (int i=0; i<materiasJueves.size();i++) {
          materiasJueves.get(i).setDemanda(false);
        }
        for (int i=0; i<materiasViernes.size();i++) {
          materiasViernes.get(i).setDemanda(false);
        }

        ///
        for (int i=0; i<materiasLunes.size();i++) {
          materiasLunes.get(i).setPopularidad(false);
        }

        for (int i=0; i<materiasMartes.size();i++) {
          materiasMartes.get(i).setPopularidad(false);
        }
        for (int i=0; i<materiasMiercoles.size();i++) {
          materiasMiercoles.get(i).setPopularidad(false);
        }
        for (int i=0; i<materiasJueves.size();i++) {
          materiasJueves.get(i).setPopularidad(false);
        }
        for (int i=0; i<materiasViernes.size();i++) {
          materiasViernes.get(i).setPopularidad(false);
        }

        //
        for (int i=0; i<materiasLunes.size();i++) {
          materiasLunes.get(i).setPpopularidad(true);
        }

        for (int i=0; i<materiasMartes.size();i++) {
          materiasMartes.get(i).setPpopularidad(true);
        }
        for (int i=0; i<materiasMiercoles.size();i++) {
          materiasMiercoles.get(i).setPpopularidad(true);
        }
        for (int i=0; i<materiasJueves.size();i++) {
          materiasJueves.get(i).setPpopularidad(true);
        }
        for (int i=0; i<materiasViernes.size();i++) {
          materiasViernes.get(i).setPpopularidad(true);
        }
        //
        for (int i=0; i<materiasLunes.size();i++) {
          materiasLunes.get(i).setCarrera(false);
        }

        for (int i=0; i<materiasMartes.size();i++) {
          materiasMartes.get(i).setCarrera(false);
        }
        for (int i=0; i<materiasMiercoles.size();i++) {
          materiasMiercoles.get(i).setCarrera(false);
        }
        for (int i=0; i<materiasJueves.size();i++) {
          materiasJueves.get(i).setCarrera(false);
        }
        for (int i=0; i<materiasViernes.size();i++) {
          materiasViernes.get(i).setCarrera(false);
        }
      }
      else if (carreraP==true) {
        image(electivasCarrera, 0, 0);
        image(electivasCarrera, 0, 0);

        for (int i=0; i<materiasLunes.size();i++) {
          materiasLunes.get(i).setDemanda(false);
        }

        for (int i=0; i<materiasMartes.size();i++) {
          materiasMartes.get(i).setDemanda(false);
        }
        for (int i=0; i<materiasMiercoles.size();i++) {
          materiasMiercoles.get(i).setDemanda(false);
        }
        for (int i=0; i<materiasJueves.size();i++) {
          materiasJueves.get(i).setDemanda(false);
        }
        for (int i=0; i<materiasViernes.size();i++) {
          materiasViernes.get(i).setDemanda(false);
        }

        ///
        for (int i=0; i<materiasLunes.size();i++) {
          materiasLunes.get(i).setPopularidad(false);
        }

        for (int i=0; i<materiasMartes.size();i++) {
          materiasMartes.get(i).setPopularidad(false);
        }
        for (int i=0; i<materiasMiercoles.size();i++) {
          materiasMiercoles.get(i).setPopularidad(false);
        }
        for (int i=0; i<materiasJueves.size();i++) {
          materiasJueves.get(i).setPopularidad(false);
        }
        for (int i=0; i<materiasViernes.size();i++) {
          materiasViernes.get(i).setPopularidad(false);
        }

        //
        for (int i=0; i<materiasLunes.size();i++) {
          materiasLunes.get(i).setPpopularidad(false);
        }

        for (int i=0; i<materiasMartes.size();i++) {
          materiasMartes.get(i).setPpopularidad(false);
        }
        for (int i=0; i<materiasMiercoles.size();i++) {
          materiasMiercoles.get(i).setPpopularidad(false);
        }
        for (int i=0; i<materiasJueves.size();i++) {
          materiasJueves.get(i).setPpopularidad(false);
        }
        for (int i=0; i<materiasViernes.size();i++) {
          materiasViernes.get(i).setPpopularidad(false);
        }
        //
        for (int i=0; i<materiasLunes.size();i++) {
          materiasLunes.get(i).setCarrera(true);
        }

        for (int i=0; i<materiasMartes.size();i++) {
          materiasMartes.get(i).setCarrera(true);
        }
        for (int i=0; i<materiasMiercoles.size();i++) {
          materiasMiercoles.get(i).setCarrera(true);
        }
        for (int i=0; i<materiasJueves.size();i++) {
          materiasJueves.get(i).setCarrera(true);
        }
        for (int i=0; i<materiasViernes.size();i++) {
          materiasViernes.get(i).setCarrera(true);
        }
      }
      textFont(fuenteTitulos, 25);

      cp5.get(Textfield.class, "usuario").hide();
      textFont(fuenteTitulos, 12);

      fill(255, 0, 0);
      text(usuario+"+" +contrasena, 10, 10);
      fill(0);


      if (lunes==true) {
        image(seleccionLunes, 0, 0);
      }
      else if (martes==true) {
        image(seleccionMartes, 0, 0);
      }
      else if (miercoles==true) {
        image(seleccionMiercoles, 0, 0);
      }
      else if (jueves==true) {
        image(seleccionJueves, 0, 0);
      }
      else if (viernes==true) {
        image(seleccionViernes, 0, 0);
      } 


      break;

    case 4:

      if (lunes==true) {
        for (int i = 0; i < materiasLunes.size(); i++) {
          materiasLunes.get(i).pintarDos();
        }
      }
      else
        if (martes==true) {
          for (int i = 0; i < materiasMartes.size(); i++) {
            materiasMartes.get(i).pintarDos();
          }
        }
        else
          if (miercoles==true) {
            for (int i = 0; i < materiasMiercoles.size(); i++) {
              materiasMiercoles.get(i).pintarDos();
            }
          }
          else
            if (jueves==true) {
              for (int i = 0; i < materiasJueves.size(); i++) {
                materiasJueves.get(i).pintarDos();
              }
            }
            else
              if (viernes==true) {
                for (int i = 0; i < materiasViernes.size(); i++) {
                  materiasViernes.get(i).pintarDos();
                }
              }
      break;
    }
  }

  public void mouse() {
    String usuario= cp5.get(Textfield.class, "usuario").getText();
  }

  public void botones(int x, int y) {
    if (pantalla == 3) {
      if (dist(55, 119, x, y)<27) {
        println("LUNES");
        lunes=true;
        martes=false;
        miercoles=false;
        jueves=false;
        viernes=false;
        sabado=false;
      }
      else if (dist(135, 119, x, y)<27) {
        println("MARTES");
        lunes=false;
        martes=true;
        miercoles=false;
        jueves=false;
        viernes=false;
        sabado=false;
      }
      else if (dist(214, 119, x, y)<27) {
        println("MIERCOLES");
        lunes=false;
        martes=false;
        miercoles=true;
        jueves=false;
        viernes=false;
        sabado=false;
      }
      else if (dist(293, 119, x, y)<27) {
        println("JUEVES");
        lunes=false;
        martes=false;
        miercoles=false;
        jueves=true;
        viernes=false;
        sabado=false;
      }
      else if (dist(372, 119, x, y)<27) {
        println("VIERNES");
        lunes=false;
        martes=false;
        miercoles=false;
        jueves=false;
        viernes=true;
        sabado=false;
      }
    }
  }

  public void borrarHoras() {
  }

  public void cambiarY(float mw) {
    fondoY += (int)mw;
  }

  public void clicked() {
    println("pantalla: " + pantalla);
    println("x: " + mouseX + " y: " + mouseY);
    switch(pantalla) {
    case 0:
      //ingresar
      if (mouseX > 110 && mouseX < 319 && mouseY > 530 && mouseY < 588) {
        pantalla = 1;
      }
      break;
    case 1:
      //Electivas
      if (mouseX > 220 && mouseX < 428 && mouseY > 0 && mouseY < 66) {
        pantalla = 3;
      }
      //lunes
      if (mouseX > 0 && mouseX < 428 && mouseY > 227 && mouseY < 335) {
        selHoraDia = 0;
        pantalla = 2;
      }
      //martes
      if (mouseX > 0 && mouseX < 428 && mouseY > 343 && mouseY < 402) {
        selHoraDia = 1;
        pantalla = 2;
      }
      //miercoles
      if (mouseX > 0 && mouseX < 428 && mouseY > 409 && mouseY < 467) {
        selHoraDia = 2;
        pantalla = 2;
      }
      //jueves
      if (mouseX > 0 && mouseX < 428 && mouseY > 475 && mouseY < 533) {
        selHoraDia = 3;
        pantalla = 2;
      }
      //viernes
      if (mouseX > 0 && mouseX < 428 && mouseY > 541 && mouseY < 599) {
        selHoraDia = 4;
        pantalla = 2;
      }
      
      break;
      //case 2
    case 2:
      //dias der
      if (mouseX > 390 && mouseX < 428 && mouseY > 450 && mouseY < 500) {
        selHoraDia ++;
        if (selHoraDia > 4) {
          selHoraDia = 0;
        }
      }
      //dias izq
      if (mouseX > 0 && mouseX < 38 && mouseY > 450 && mouseY < 500) {
        selHoraDia --;
        if (selHoraDia < 0) {
          selHoraDia = 4;
        }
      }
      //Electivas
      if (mouseX > 220 && mouseX < 428 && mouseY > 0 && mouseY < 66) {
        pantalla = 3;
      }
      //HORARIO abajo
      if (mouseX > 97 && mouseX < 189 && mouseY > 665 && mouseY < 730) {
        pantalla = 1;
      }
      switch(selHoraDia) {
      case 0: //lunes
        rLunes.clicked(mouseX, mouseY);
        if (!hLunes.equals(rLunes.getHoras())) {
          hLunes.clear();
          hLunes.addAll(rLunes.getHoras());
        }
        if(mouseX > 239 && mouseX < 330 && mouseY > 665 && mouseY < 730){
          rLunes.borrarHoras();
        }
        println("Horas Lunes: " + hLunes);         
        break;

      case 1: //martes
        rMartes.clicked(mouseX, mouseY); 
        if (!hMartes.equals(rMartes.getHoras())) {
          hMartes.clear();
          hMartes.addAll(rMartes.getHoras());
        }
        if(mouseX > 239 && mouseX < 330 && mouseY > 665 && mouseY < 730){
          rMartes.borrarHoras();
        }
        println("Horas Martes: " + hMartes);        
        break;

      case 2: //miercoles
        rMiercoles.clicked(mouseX, mouseY);
        if (!hMiercoles.equals(rMiercoles.getHoras())) {
          hMiercoles.clear();
          hMiercoles.addAll(rMiercoles.getHoras());
        }
        if(mouseX > 239 && mouseX < 330 && mouseY > 665 && mouseY < 730){
          rMiercoles.borrarHoras();
        }
        println("Horas Miercoles: " + hMiercoles);        
        break;

      case 3: //jueves
        rJueves.clicked(mouseX, mouseY);
        if (!hJueves.equals(rJueves.getHoras())) {
          hJueves.clear();
          hJueves.addAll(rJueves.getHoras());
        }
        if(mouseX > 239 && mouseX < 330 && mouseY > 665 && mouseY < 730){
          rJueves.borrarHoras();
        }
        println("Horas Jueves: " + hJueves);        
        break;

      case 4: //viernes
        rViernes.clicked(mouseX, mouseY);
        if (!hViernes.equals(rViernes.getHoras())) {
          hViernes.clear();
          hViernes.addAll(rViernes.getHoras());
        }
        if(mouseX > 239 && mouseX < 330 && mouseY > 665 && mouseY < 730){
          rViernes.borrarHoras();
        }
        println("Horas Viernes: " + hViernes);       
        break;
      }
      break;
      //fin case 2
    case 3:
      if (mouseX > 0 && mouseX < 207 && mouseY > 0 && mouseY < 66) {
        pantalla = 1;
      }
      //izq filtro
      if (dist(mouseX, mouseY, 29, 288)< 17) {
        selTipoFiltro --;
        if (selTipoFiltro < 1) {
          selTipoFiltro = 4;
        }
      }
      //der filtro
      if (dist(mouseX, mouseY, 400, 288)< 17) {
        selTipoFiltro ++;
        if (selTipoFiltro > 4) {
          selTipoFiltro = 1;
        }
      }


      if (mouseX > 0 && mouseX < 428 && mouseY > 372 && mouseY <720) {

        for (int i=0; i<materiasLunes.size(); i++) {      
          if (lunes == true && materiasLunes.get(i).seleccionar(fondoY+(i * offsetY))) {
            pantalla = 4;
            materiasLunes.get(i).pintarDos();
            println("materia:" + materiasLunes.get(i).getNombre());
          }
        }
        for (int i=0; i<materiasMartes.size(); i++) {      
          if (martes == true && materiasMartes.get(i).seleccionar(fondoY+(i * offsetY))) {
            pantalla = 4;
            materiasMartes.get(i).pintarDos();
            println("materia:" + materiasMartes.get(i).getNombre());
          }
        }
        for (int i=0; i<materiasMiercoles.size(); i++) {      
          if (miercoles == true && materiasMiercoles.get(i).seleccionar(fondoY+(i * offsetY))) {
            pantalla = 4;
            materiasMiercoles.get(i).pintarDos();
            println("materia:" + materiasMiercoles.get(i).getNombre());
          }
        }
        for (int i=0; i<materiasJueves.size(); i++) {      
          if (jueves == true && materiasJueves.get(i).seleccionar(fondoY+(i * offsetY))) {
            pantalla = 4;
            materiasJueves.get(i).pintarDos();
            println("materia:" + materiasJueves.get(i).getNombre());
          }
        }
        for (int i=0; i<materiasViernes.size(); i++) {      
          if (viernes == true && materiasViernes.get(i).seleccionar(fondoY+(i * offsetY))) {
            pantalla = 4;
            materiasViernes.get(i).pintarDos();
            println("materia:" + materiasViernes.get(i).getNombre());
          }
        }
      }
      break;
      //fin case 3
    case 4:
      if (dist(mouseX, mouseY, 34, 60)< 17) {
        pantalla=3;
      }

      //MATRICULAR
      if (mouseX > 107 && mouseX < 326 && mouseY > 687 && mouseY < 748) {

        for (int i=0; i<materiasLunes.size(); i++) {      
          if (materiasLunes.get(i).getSel()) {
            materiasLunes.get(i).setMatriculado(true);
            matriculadoLunes.add(materiasLunes.get(i));
            println(materiasLunes.get(i).getMatriculado());
            println("mLunes: " + matriculadoLunes.size());
          }
        }
        for (int i=0; i<materiasMartes.size(); i++) {      
          if (materiasMartes.get(i).getSel()) {
            materiasMartes.get(i).setMatriculado(true);
            matriculadoMartes.add(materiasMartes.get(i));
            println(materiasMartes.get(i).getMatriculado());
            println("mMartes: " + matriculadoMartes.size());
          }
        }
        for (int i=0; i<materiasMiercoles.size(); i++) {      
          if (materiasMiercoles.get(i).getSel()) {
            materiasMiercoles.get(i).setMatriculado(true);
            matriculadoMiercoles.add(materiasMiercoles.get(i));
            println(materiasMiercoles.get(i).getMatriculado());
            println("mMiercoles: " + matriculadoMiercoles.size());
          }
        }
        for (int i=0; i<materiasJueves.size(); i++) {      
          if (materiasJueves.get(i).getSel()) {
            materiasJueves.get(i).setMatriculado(true);
            matriculadoJueves.add(materiasJueves.get(i));
            println(materiasJueves.get(i).getMatriculado());
            println("mJueves: " + matriculadoJueves.size());
          }
        }
        for (int i=0; i<materiasViernes.size(); i++) {      
          if (materiasViernes.get(i).getSel()) {
            materiasViernes.get(i).setMatriculado(true);
            matriculadoViernes.add(materiasViernes.get(i));
            println(materiasViernes.get(i).getMatriculado());
            println("mViernes: " + matriculadoViernes.size());
          }
        }

        pantalla=1;
      }
      break;
    }
  }//fin metodo
}

