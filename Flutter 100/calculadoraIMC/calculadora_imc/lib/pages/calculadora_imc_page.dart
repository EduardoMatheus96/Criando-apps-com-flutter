import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CalculadoraIMCPage extends StatefulWidget {
  const CalculadoraIMCPage({Key? key}) : super(key: key);

  @override
  State<CalculadoraIMCPage> createState() => _CalculadoraIMCPageState();
}

class _CalculadoraIMCPageState extends State<CalculadoraIMCPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh)),
        ],
      ),
    );
  }
}
