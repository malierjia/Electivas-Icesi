public class ClaseComparatorMateriaDemanda implements Comparator<Materia> {

  public int compare(Materia a, Materia b) {
    return a.getDemanda()- b.getDemanda();
  }
}

public class ClaseComparatorHora implements Comparator<Materia> {

  public int compare(Materia a, Materia b) {
    return a.getHoraI()- b.getHoraI();
  }
}

public class ClaseComparatorCupo implements Comparator<Materia> {

  public int compare(Materia a, Materia b) {
    return a.getCupo()- b.getCupo();
  }
}

public class ClaseComparatorOferta implements Comparator<Materia> {

  public int compare(Materia a, Materia b) {
    return a.getOferta()- b.getOferta();
  }
}

public class ClaseComparatorPopularidad implements Comparator<Materia> {

  public int compare(Materia a, Materia b) {
    return a.getPopularidad()- b.getPopularidad();
  }
}

public class ClaseComparatorProfesor implements Comparator<Materia> {

  public int compare(Materia a, Materia b) {
    return a.getProfesorP()- b.getProfesorP();
  }
}
 
 public class ClaseComparatorCarrera implements Comparator<Materia> {

  public int compare(Materia a, Materia b) {
    return a.getCarrera()- b.getCarrera();
  }
}



