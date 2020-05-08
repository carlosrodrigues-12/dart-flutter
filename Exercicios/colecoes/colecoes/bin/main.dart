void main(List<String> arguments) {
  var lista = [23, 5, 4, 25, 45, 14, 143];

  var solista = List<String>();
  solista.add('Carlos Rodrigues');
  solista.add('Roberto');
  solista.add('Rodrigo');

  for(var i=0; i<solista.length; i++){
    print('$i nome da lista é ${solista[i]}');
  }

  // print(lista[0]);
  // print(lista.length);
  // for(var i=0; i<lista.length; i++){
  //   print('$i valor da lista ${lista[i]}');
  // }
  // print('Ultimo indice da lista ${lista[lista.length-1]}');
}
