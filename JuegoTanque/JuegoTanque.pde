PImage imgMuro, imgTanque, imgBala;
GestorMurallas gestor;
Tanque tanque;

void setup() {
  size(800, 600);
  imgMuro = loadImage("muro.png");
  imgTanque = loadImage("tanque.png");
  imgBala = loadImage("bala.png");

  gestor = new GestorMurallas();
  gestor.agregarMuro(new Muro(new Transform(100, 100, 50, 50), 30, imgMuro));
  gestor.agregarMuro(new Muro(new Transform(200, 100, 50, 50), 20, imgMuro));
  gestor.agregarMuro(new Muro(new Transform(300, 100, 50, 50), 30, imgMuro));
  gestor.agregarMuro(new Muro(new Transform(400, 100, 50, 50), 20, imgMuro));
  gestor.agregarMuro(new Muro(new Transform(500, 100, 50, 50), 30, imgMuro));
  gestor.agregarMuro(new Muro(new Transform(600, 100, 50, 50), 20, imgMuro));
  
  tanque = new Tanque(new Transform(width / 2, height - 60, 50, 50), imgTanque);
}

void draw() {
  float deltaTime = 1.0 / frameRate;
  background(255);

  gestor.dibujarMuros();
  tanque.mover(deltaTime);
  tanque.dibujar();
  tanque.disparar(deltaTime);
  
  gestor.verificarColision(tanque.balas);
}
