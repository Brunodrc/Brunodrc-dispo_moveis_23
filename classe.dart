class Veiculo {
  String cor;
  int velocidade;
  double peso;

  Veiculo(this.cor, this.velocidade, this.peso);
}

class Carro extends Veiculo {
  Carro(super.cor, super.velocidade, super.peso);
}

class Aviao extends Veiculo {
  int numero_helices;

  Aviao(this.numero_helices, super.cor, super.velocidade, super.peso);
}

void main() {
  Carro fusca = Carro('verde', 100, 1200);

  print(fusca);
  print(fusca.cor);
  print(fusca.velocidade);
  print(fusca.peso);

  Aviao puma = Aviao(4, 'azul', 600, 900);

  print(puma);
  print(puma.numero_helices);
  print(puma.cor);
  print(puma.velocidade);
  print(puma.peso);
}
