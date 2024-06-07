class Tanque {
  Transform transform;
  PImage img;
  float velocidad;
  ArrayList<Bala> balas;

  Tanque(Transform transform, PImage img) {
    this.transform = transform;
    this.img = img;
    this.velocidad = 200;
    this.balas = new ArrayList<Bala>();
  }

  void mover(float deltaTime) {
    if (keyPressed) {
      if (key == 'a' || key == 'A') {
        transform.x -= velocidad * deltaTime;
      } else if (key == 'd' || key == 'D') {
        transform.x += velocidad * deltaTime;
      }
    }
  }

  void disparar(float deltaTime) {
    if (keyPressed && key == 'q') {
      balas.add(new Bala(new Transform(transform.x + transform.width / 2 - 5, transform.y, 10, 20), 300));
    }

    for (int i = balas.size() - 1; i >= 0; i--) {
      Bala bala = balas.get(i);
      bala.mover(deltaTime);
      bala.dibujar();
      if (bala.transform.y < 0) {
        balas.remove(i);
      }
    }
  }

  void dibujar() {
    image(img, transform.x, transform.y, transform.width, transform.height);
  }
}
