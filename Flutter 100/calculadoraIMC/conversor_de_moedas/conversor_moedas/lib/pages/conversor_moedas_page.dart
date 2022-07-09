import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:convert';

const request = "https://api.hgbrasil.com/finance?format=json&key=6cd3df2e";

class ConversorMoedas extends StatefulWidget {
  const ConversorMoedas({Key? key}) : super(key: key);

  @override
  State<ConversorMoedas> createState() => _ConversorMoedasState();
}

class _ConversorMoedasState extends State<ConversorMoedas> {
  void requestt() async {
    http.Response response = await http.get(Uri.parse(request));
    print(json.decode(response.body)["results"]["currencies"]["USD"]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: requestt,
        child: const Text('AKI'),
      ),
    );
  }
}
