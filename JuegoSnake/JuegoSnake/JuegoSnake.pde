PImage imgRaton, imgPajarito, imgInsecto;
Snake snake;
ArrayList<Animal> animales;
int puntaje;
int tiempoInicio;
int tiempoActual;

void setup() {
  size(800, 600);
  imgRaton = loadImage("raton.png");
  imgPajarito = loadImage("pajaro.png");
  imgInsecto = loadImage("insecto.png");

  snake = new Snake(width / 2, height / 2);
  animales = new ArrayList<Animal>();
  animales.add(new Raton(random(width), random(height), imgRaton));
  puntaje = 0;
  tiempoInicio = millis();
}

void draw() {
  float deltaTime = 1.0 / frameRate;
  tiempoActual = millis() - tiempoInicio;

  background(255);
  snake.mover(deltaTime);
  snake.dibujar();

  for (Animal animal : animales) {
    animal.dibujar();
    if (snake.verificarColision(animal)) {
      puntaje += animal.puntaje;
      snake.crecer();
      animales.remove(animal);
      animales.add(generarAnimalAleatorio());
      break;
    }
  }

  fill(0);
  textSize(20);
  text("Puntaje: " + puntaje, 10, 20);
  text("Tiempo: " + tiempoActual / 1000 + "s", 10, 40);

  if (tiempoActual > 60000) {
    noLoop();
    text("Juego Terminado", width / 2 - 50, height / 2);
  }
}

Animal generarAnimalAleatorio() {
  int tipo = int(random(3));
  if (tipo == 0) {
    return new Raton(random(width), random(height), imgRaton);
  } else if (tipo == 1) {
    return new Pajarito(random(width), random(height), imgPajarito);
  } else {
    return new Insecto(random(width), random(height), imgInsecto);
  }
}
