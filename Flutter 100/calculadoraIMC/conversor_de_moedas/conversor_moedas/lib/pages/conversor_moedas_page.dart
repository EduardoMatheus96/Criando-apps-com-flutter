import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const request = "https://api.hgbrasil.com/finance?format=json&key=6cd3df2e";

class ConversorMoedas extends StatefulWidget {
  const ConversorMoedas({Key? key}) : super(key: key);

  @override
  State<ConversorMoedas> createState() => _ConversorMoedasState();
}

class _ConversorMoedasState extends State<ConversorMoedas> {
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  double dollar = 0.0;
  double euro = 0.0;

  Future<Map> getData() async {
    http.Response response = await http.get(Uri.parse(request));
    return json.decode(response.body);
  }

  void _realChanged(String text) {
    double real = 0.0;
    if (text == '') {
      real = 0.0;
    } else {
      real = double.parse(text);
      dolarController.text = (real / dollar).toStringAsFixed(2);
      euroController.text = (real / euro).toStringAsFixed(2);
    }
  }

  void _dolarChanged(String text) {
    double dolar;
    if (text == '') {
      dolar = 0.0;
    } else {
      dolar = double.parse(text);
      realController.text = (dolar * dollar).toStringAsFixed(2);
      euroController.text = ((dolar * dollar) / euro).toStringAsFixed(2);
    }
  }

  void _euroChanged(String text) {
    double euro;
    if (text == '') {
      euro = 0.0;
    } else {
      euro = double.parse(text);
      realController.text = (euro * this.euro).toStringAsFixed(2);
      dolarController.text = ((euro * this.euro) / dollar).toStringAsFixed(2);
    }
  }

  Widget buildTextField(String label, String prefix,
      TextEditingController control, void Function(String)? func) {
    return TextField(
      controller: control,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.amber),
        border: const OutlineInputBorder(),
        prefixText: prefix,
      ),
      style: const TextStyle(
        color: Colors.amber,
        fontSize: 25.0,
      ),
      onChanged: func,
      keyboardType: TextInputType.number,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("\$ Conversor \$"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(
                child: Text(
                  "Carregando Dados...",
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 25.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            default:
              if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    "Erro ao Carregar Dados",
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 25.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                dollar = snapshot.data!["results"]["currencies"]["USD"]["buy"];
                euro = snapshot.data!["results"]["currencies"]["EUR"]["buy"];
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Icon(Icons.monetization_on,
                          size: 150.0, color: Colors.amber),
                      buildTextField(
                          "Reais", "R\$ ", realController, _realChanged),
                      const Divider(),
                      buildTextField(
                          "Dolares", "US\$ ", dolarController, _dolarChanged),
                      const Divider(),
                      buildTextField(
                          "Euros", "€\$ ", euroController, _euroChanged),
                    ],
                  ),
                );
              }
          }
        },
      ),
    );
  }
}
