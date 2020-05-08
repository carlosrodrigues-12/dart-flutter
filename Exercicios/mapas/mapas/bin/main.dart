void main(List<String> arguments) {
  var jogadores = {
    "primeiro" : "Pedro",
    "segundo" : "Messi",
    "terceiro" : "Ronaldo",
    "quarto" : "Pelé"
  };

  var musicos = {
    1 : "Djavan",
    2 : "Caetano Veloso",
    3 : "Roberto Carlos",
    4 : "Samuel Rocha"
  };
  //print(jogadores['primeiro']);
  jogadores.forEach((c,v) => print(c));

  var chaves = jogadores.keys;
  var valores = jogadores.values;
  print(chaves);
  print(valores);
}
