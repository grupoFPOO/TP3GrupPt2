class GestorMurallas {
  ArrayList<Muro> muros;

  GestorMurallas() {
    muros = new ArrayList<Muro>();
  }

  void agregarMuro(Muro muro) {
    muros.add(muro);
  }

  void dibujarMuros() {
    for (Muro muro : muros) {
      muro.dibujar();
    }
  }

  void verificarColision(ArrayList<Bala> balas) {
    for (int i = balas.size() - 1; i >= 0; i--) {
      Bala bala = balas.get(i);
      for (int j = muros.size() - 1; j >= 0; j--) {
        Muro muro = muros.get(j);
        if (bala.colisionaCon(muro)) {
          muro.resistencia -= 10;
          balas.remove(i);
          if (muro.resistencia <= 0) {
            muros.remove(j);
          }
          break;
        }
      }
    }
  }
}
