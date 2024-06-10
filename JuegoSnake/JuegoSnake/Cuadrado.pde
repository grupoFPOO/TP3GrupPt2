class Cuadrado {
  float x, y;

  Cuadrado(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void dibujar() {
    rect(x, y, 20, 20);
  }
}
