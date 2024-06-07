class Bala {
  Transform transform;
  float velocidad;

  Bala(Transform transform, float velocidad) {
    this.transform = transform;
    this.velocidad = velocidad;
  }

  void mover(float deltaTime) {
    transform.y -= velocidad * deltaTime;
  }

  void dibujar() {
    image(imgBala, transform.x, transform.y, transform.width, transform.height);
  }

  boolean colisionaCon(Muro muro) {
    return transform.x < muro.transform.x + muro.transform.width &&
           transform.x + transform.width > muro.transform.x &&
           transform.y < muro.transform.y + muro.transform.height &&
           transform.y + transform.height > muro.transform.y;
  }
}
