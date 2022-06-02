void main() {
  Cachorro cachorro1 = Cachorro('Rex', 3);
  cachorro1.comer();
  cachorro1.dormir();
  cachorro1.latir();
  print(cachorro1);
  cachorro1.morrer();
  print('\n');

  Gato gato1 = Gato('Fluflu', 5);
  gato1.comer();
  gato1.dormir();
  gato1.miar();
  print(gato1);
  gato1.morrer();
}

//Usando abstract eu indico que eu n posso intanciar a classe Animal ou seja eu nao posso fazer
// Animal animal1 = Animal('toto' , 5);
abstract class Animal {
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

  //Quando eu nao faço o {} numa funcao duma classe super isso faz com que todas as classes que herdarem
  //essa classe eu seja obrigado a criar essa funcao
  void morrer();
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

  @override
  void morrer() {
    print('Muito Triste');
  }
}

class Gato extends Animal {
  Gato(String nome, int idade) : super(nome, idade);

  int vidas = 9;
  void miar() {
    print('Miauuu');
  }

  @override
  void morrer() {
    vidas--;
    print('Restam $vidas vidas');
  }
}
