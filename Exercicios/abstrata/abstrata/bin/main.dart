abstract class Animal{
  respirar();
  fazBarulho(){
    print('Faz barulho');
  }
}

class Humorista extends Pessoa implements Engracado{
  Humorista(String nome, String nacionalidade) : super(nome, nacionalidade);

  @override
  fazerRir() {
    print('Humorista engraçado');
  }
}

abstract class Engracado{
  fazerRir();
}

class Pessoa implements Animal{
  String nome, nacionalidade;
  Pessoa(this.nome, this.nacionalidade);
  @override
  respirar() {
    print('Respirando');
  }
  @override
  fazBarulho() {
    print('Faz barulho imp');
  }
}

void main(List<String> arguments) {
  var pessoa = new Pessoa('Carlos', 'Brasileira');
  pessoa.respirar();
  pessoa.fazBarulho();

  var ghumor = new Humorista('Jose', 'Sueco');
  ghumor.fazBarulho();
  ghumor.respirar();
  ghumor.fazerRir();
}
