class Animal {
  float x, y;
  int puntaje;
  PImage img;

  Animal(float x, float y, int puntaje, PImage img) {
    this.x = x;
    this.y = y;
    this.puntaje = puntaje;
    this.img = img;
  }

  void dibujar() {
    image(img, x, y, 35, 35);
  }
}
