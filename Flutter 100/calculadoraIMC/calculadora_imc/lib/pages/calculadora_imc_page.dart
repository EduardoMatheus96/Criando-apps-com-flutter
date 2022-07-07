import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CalculadoraIMCPage extends StatefulWidget {
  const CalculadoraIMCPage({Key? key}) : super(key: key);

  @override
  State<CalculadoraIMCPage> createState() => _CalculadoraIMCPageState();
}

class _CalculadoraIMCPageState extends State<CalculadoraIMCPage> {
  TextEditingController weightControler = TextEditingController();
  TextEditingController heightControler = TextEditingController();

  String _infoText = "Informe seus dados!";

  void _resetFields() {
    weightControler.text = "";
    heightControler.text = "";
    _infoText = "Informe seus dados!";
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightControler.text);
      double height = double.parse(heightControler.text) / 100;
      double imc = weight / (height * height);
      print(imc);
      if (imc < 18.6) {
        _infoText = "Abaixo do Peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = "Peso Ideal (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = "Levemente Acima do Peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = "Obesidade Grau II (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 40) {
        _infoText = "Obesidade Grua III (${imc.toStringAsPrecision(4)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed: _resetFields, icon: const Icon(Icons.refresh)),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.person_outline,
              size: 120.0,
              color: Colors.green,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Peso (kg)",
                labelStyle: TextStyle(color: Colors.green),
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.green, fontSize: 25.0),
              controller: weightControler,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Altura (cm)",
                labelStyle: TextStyle(color: Colors.green),
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.green, fontSize: 25.0),
              controller: heightControler,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: ElevatedButton(
                onPressed: _calculate,
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: const EdgeInsets.all(15),
                ),
                child: const Text(
                  "Calcular",
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
              ),
            ),
            Text(
              _infoText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 25.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
