import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//se eu diitar stless ja aparace a funcao pronto parar eu apenas modificar
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

// O StatefulWidget eu consigo modificar aki e automaticamente mudar na tela do celular
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });

    print(count);
  }

  void increment() {
    setState(() {
      count++;
    });
    print(count);
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/image.jpg'),
              fit: BoxFit.cover,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isFull ? 'Lotado' : 'Pode entrar!',
                  style: TextStyle(
                    fontSize: 30,
                    color: isFull ? Colors.red : Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(40),
                  child: Text(
                    count.toString(), // OU '$count',
                    style: TextStyle(
                        fontSize: 100,
                        color: isFull
                            ? Colors.red
                            : isEmpty
                                ? Colors.green
                                : Colors.white),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: isEmpty ? null : decrement,
                      style: TextButton.styleFrom(
                        backgroundColor: isEmpty
                            ? Colors.white.withOpacity(0.2)
                            : Colors.white,
                        //padding: const EdgeInsets.all(32)  - Espaçamento em volta do texto
                        fixedSize: const Size(100, 100),
                        primary: Colors
                            .black, // Modifica a cor do efeito ao apertar o botao
                        shape: RoundedRectangleBorder(
                            //side: BorderSide(color: Colors.green, width: 5) - Usado para criar uma borda em volta do botao
                            borderRadius: BorderRadius.circular(24)),
                      ),
                      child: const Text(
                        'Saiu',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      // É um widget criado apenas para gerar um espaçamento entre os botoes
                      width: 32,
                    ),
                    TextButton(
                      onPressed: isFull ? null : increment,
                      style: TextButton.styleFrom(
                        backgroundColor: isFull
                            ? Colors.white.withOpacity(0.2)
                            : Colors.white,
                        //padding: const EdgeInsets.all(32) - O problema com o padding é q como os textos tem tamanhos diferentes os quadrados dos botoes ficam com tamanhos diferentes
                        fixedSize: const Size(100, 100),
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: const Text('Entrou',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          )),
                    )
                  ],
                ),
              ],
            )));
  }
}
