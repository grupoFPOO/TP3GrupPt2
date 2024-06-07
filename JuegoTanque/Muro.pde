class Muro {
  Transform transform;
  int resistencia;
  PImage img;

  Muro(Transform transform, int resistencia, PImage img) {
    this.transform = transform;
    this.resistencia = resistencia;
    this.img = img;
  }

  void dibujar() {
    image(img, transform.x, transform.y, transform.width, transform.height);
  }
}
