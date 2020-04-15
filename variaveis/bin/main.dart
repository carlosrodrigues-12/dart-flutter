import 'package:variaveis/variaveis.dart' as variaveis;

main(List<String> arguments) {
    var i = 0;
    var nome = 'Carlos';
    var idade = '19';
    int idade2 = 19;
    String nome2 = 'Carlos Rodrigues';

    num id = 45;

    int num2 = 14;

    double numreal = 13.33;

    print('Alo Mundo, eu sou $nome e tenho ${variaveis.calculate()} anos!');
    print('$nome tem $idade anos e o metodo tem valor -> ${variaveis.outroMetodo()}!');

    nome2 = nome2 + 'String concatenada';

    print('$nome $idade $nome2 $idade2 $id $num2 $numreal');
}
