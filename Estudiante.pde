public class Estudiante {

  private String nombre, apellido, carrera, codigo ;
  private int pc;
  private String lunes, martes, miercoles, jueves, viernes;
  
  public Estudiante(String nombre, String apellido, String codigo, String carrera, int pc, String lunes, String martes, String miercoles,String jueves, String viernes) {

    this.nombre=nombre;
    this.apellido=apellido;
    this.codigo=codigo;
    this.carrera=carrera;
    this.pc=pc; 
    this.lunes=lunes;
    this.martes=martes; 
    this.miercoles=miercoles;
    this.jueves=jueves; 
    this.viernes=viernes;
     
     
  }

  public String getNombre() {
    return nombre;
  }
  public String getCarrera() {
    return carrera;
  }
  
  public int getPc() {
    return pc;
  }
    public String getCodigo() {
    return codigo;
  }

  public String getApellido() {
    return apellido;
  }
 

  public String getLunes() {
    return lunes;
  }
 
 public String getMartes() {
    return martes;
  }
  
   public String getMiercoles() {
    return miercoles;
  }
   public String getJueves() {
    return jueves;
  }
   public String getViernes() {
    return viernes;
  }
  
}

