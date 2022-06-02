void main() {
  Cachorro cachorro1 = Cachorro('Rex', 3);
  cachorro1.comer();
  cachorro1.dormir();
  cachorro1.latir();
  print(cachorro1);
  print('\n');

  Gato gato1 = Gato('Fluflu', 5);
  gato1.comer();
  gato1.dormir();
  gato1.miar();
  print(gato1);
}

class Animal {
  Animal(this.nome, this.idade);

  String nome;
  int idade;

  void comer() {
    print('Comeu');
  }

  void dormir() {
    print('Durmiu');
  }

  @override
  String toString() {
    return 'Nome: $nome Idade: $idade';
  }
}

class Cachorro extends Animal {
  Cachorro(String nome, int idade) : super(nome, idade) {
    print('Criou o Cachorro $nome');
  }

  void latir() {
    print('Au Au');
  }

  @override
  void dormir() {
    super
        .dormir(); //Com o super podemos chamar o metodo da funçao a qual a classe atual extendeu qnd vc reescreve essa funcao
    print('Roncando muito');
  }
}

class Gato extends Animal {
  Gato(String nome, int idade) : super(nome, idade);

  void miar() {
    print('Miauuu');
  }
}
