public class Segmento {

  private float posX, posY;
  private float angulo, inicia, termina, radio, i, hora;
  private boolean seleccionado;

  public Segmento(float px, float py, float radio, float _inicia, float angulo, float i) {
    posX = px;
    posY = py; 
    this.i = i;
    this.angulo = angulo;
    this.radio = radio;        
    this.inicia = radians(_inicia +i); 
    termina = radians(_inicia+angulo+i); 
    //ajustar angulos dentro de los 360 grados
    if (termina > TWO_PI) {
      termina = termina - TWO_PI;
    } 
    else {
      termina = termina;
    }
    
    if (inicia > TWO_PI) {
      inicia = inicia - TWO_PI;
    } 
    else {
      inicia = inicia;
    }   
    seleccionado=false;

    hora = 7+i/angulo;    
    //println(hora);
  } 

  public void pintar() {  
    if (seleccionado) {
      color s = color(116, 206, 178);
      fill(s);
      stroke(s);
    } 
    else {
      stroke(23, 174, 126); 
      fill(23, 174, 126);
    }  
    //arc modes: OPEN, CHORD, PIE    
    pushMatrix();
    translate(posX,posY);
    rotate(-HALF_PI);
    arc(0,0, radio, radio, inicia, termina, PIE);    
    popMatrix();    
  }

  public void seleccionar(float x, float y) {
   // translate(posX, posY); 
    //angulo   
 
    float angMouse = atan2(y-posY, x-posX)+HALF_PI;    
    float angDos;
    
    //ajustar valores de 0 a 360 de atan2
    if (angMouse<0) {
      angDos = angMouse + TWO_PI;
    } 
    else {
      angDos = angMouse;
    } 
    //evalua si esta dentro del angulo

    if (angDos > inicia && angDos < termina && dist(x, y, posX, posY)>90 && dist(x, y, posX, posY)<radio/2) {
      seleccionado = !seleccionado;
      println("HORA: "+hora);
    }    
    
    //variables locales para imprimir en grados
    float ini = degrees(inicia);
    float fin = degrees(termina);
    float an2 = degrees(angDos);
    //println("-----------------------------------");
    //println("hora: " + hora + " inicia: " + ini + " termina: " + fin);
    //println("angDos: " + an2);
  }

  public boolean getSel() {
    return seleccionado;
  }
  public void setSel(boolean s) {
    seleccionado = s;
  }  
  public float getHora() {
    return hora;
  }
}
