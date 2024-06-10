class Snake {
  Cuadrado cabeza;
  ArrayList<Cuadrado> cuerpo;
  int direccion; // 0: derecha, 1: abajo, 2: izquierda, 3: arriba
  float velocidad;

  Snake(float x, float y) {
    cabeza = new Cuadrado(x, y);
    cuerpo = new ArrayList<Cuadrado>();
    direccion = 0;
    velocidad = 200;
  }

  void mover(float deltaTime) {
    float paso = velocidad * deltaTime;
    if (keyPressed) {
      if (keyCode == UP) {
        direccion = 3;
      } else if (keyCode == DOWN) {
        direccion = 1;
      } else if (keyCode == LEFT) {
        direccion = 2;
      } else if (keyCode == RIGHT) {
        direccion = 0;
      }
    }

    for (int i = cuerpo.size() - 1; i > 0; i--) {
      cuerpo.get(i).x = cuerpo.get(i - 1).x;
      cuerpo.get(i).y = cuerpo.get(i - 1).y;
    }
    if (cuerpo.size() > 0) {
      cuerpo.get(0).x = cabeza.x;
      cuerpo.get(0).y = cabeza.y;
    }

    if (direccion == 0) {
      cabeza.x += paso;
    } else if (direccion == 1) {
      cabeza.y += paso;
    } else if (direccion == 2) {
      cabeza.x -= paso;
    } else if (direccion == 3) {
      cabeza.y -= paso;
    }
  }

  void crecer() {
    cuerpo.add(new Cuadrado(cabeza.x, cabeza.y));
  }

  void dibujar() {
    cabeza.dibujar();
    for (Cuadrado parte : cuerpo) {
      parte.dibujar();
    }
  }

  boolean verificarColision(Animal animal) {
    return cabeza.x < animal.x + 35 &&
           cabeza.x + 35 > animal.x &&
           cabeza.y < animal.y + 35 &&
           cabeza.y + 35 > animal.y;
  }
}
