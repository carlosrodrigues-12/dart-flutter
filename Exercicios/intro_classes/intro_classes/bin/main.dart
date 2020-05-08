class Microfone{
  String nome;
  String cor;
  int modelo;
  String marca;

  Microfone(String nome, String cor, int modelo, String marca){
    this.nome = nome;
    this.cor = cor;
    this.modelo = modelo;
    this.marca = marca;
  }

  aumentarVolume(){
    print('$nome foi aumentado');
  }

  abaixaVolume(){
    print('$nome foi diminuído');
  }
}

void main(List<String> arguments) {
  var blue = new Microfone("blue", "vermelho", 2, "yamaha");

  blue.aumentarVolume();
  blue.abaixaVolume();

  print('O ${blue.nome} é ${blue.cor} tem modelo ${blue.modelo} e marca ${blue.marca}.');
}
