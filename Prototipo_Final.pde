import jxl.*;
import java.util.*;
import controlP5.*;

Logica app;
int up=0, down=0;
void setup() {
  size(428, 760);
  app=new Logica(this);
}

void draw() {
  background(255);
  app.pintar();
}
void keyPressed() {
  app.control();
  switch(key) {
  case 'r':
    app.borrarHoras();
    break;
  }  
}
void mouseWheel(MouseEvent event) {
  float e = event.getAmount();
  if (e>0) {
    up--; 
    down =0;
    app.cambiarY(up);
  }
  if (e<0) {
    down++; 
    up=0;
    app.cambiarY(down);
  }
  //println("up: " + up + " down: " + down);
}

void mousePressed() {
  app.mouse();
  app.clicked();
  app.botones(mouseX, mouseY);
}




