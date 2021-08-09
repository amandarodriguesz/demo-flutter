import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Animacao.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController txtcep = new TextEditingController();
  String resultado = "";

  _consultaCep() async {
    String cep = txtcep.text;

    String url = "https://viacep.com.br/ws/${cep}/json/";

    http.Response response;
    response = await http.get(Uri.parse(url));

    Map<String, dynamic> retorno = json.decode(response.body);

    String logradouro = retorno["logradouro"];
    String localidade = retorno["localidade"];
    String bairro = retorno["bairro"];

    setState(() {
      resultado = "${logradouro},${localidade},${bairro}";
    });
  }

  _proximaPagina() {
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (BuildContext context) => Animacao()));
    Navigator.pushNamed(context, 'a/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      appBar: AppBar(
        title: Text("Consultando um CEP via API"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite o Cep ex: 79290000",
              ),
              style: TextStyle(fontSize: 15),
              controller: txtcep,
            ),
            Text(
              "Resultado: ${resultado}",
              style: TextStyle(fontSize: 25),
            ),
            ElevatedButton(
              child: Text(
                "Consultar",
                style: TextStyle(fontSize: 15),
              ),
              onPressed: _consultaCep,
            ),
            FloatingActionButton(
              onPressed: _proximaPagina,
              tooltip: 'Avançar',
              child: Icon(Icons.arrow_forward),
            )
          ],
        ),
      ),
    );
  }
}
