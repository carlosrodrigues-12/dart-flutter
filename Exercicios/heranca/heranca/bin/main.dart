class Pessoa{
  String nome, sobrenome;
  int idade;

  printnome(){
    print(this.nome);
  }
}

class Jorge extends Pessoa{
  String telefone;

  printtel(){
    print(this.telefone);
  }

  @override
  printnome() {
    print('Sobreposto');
  }
}

class Localizacao{
  num lat, lon;

  Localizacao(this.lat, this.lon);
}

class Planalto extends Localizacao{
  num elevacao;
  Planalto(num lat, num lon, this.elevacao) : super(lat, lon);
  @override
  String toString() {
    String resultado = "A elevação do planalto é ${this.elevacao} e latitude ${this.lat} e longitude ${this.lon}";
    return resultado;
  }
}
void main(List<String> arguments) {
  // var jorge = new Jorge();
  // jorge.nome = 'jorge';
  // jorge.telefone = '64992588718';
  // jorge.printnome();
  // jorge.printtel();

  String nome = 'Carlos';
  Object a = new Object();
  

  var planalto = new Planalto(89.89, 134.12, 324);

  print(planalto);
}
