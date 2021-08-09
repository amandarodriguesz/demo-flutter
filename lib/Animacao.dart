import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Animacao extends StatefulWidget {
  @override
  _AnimacaoState createState() => _AnimacaoState();
}

class _AnimacaoState extends State<Animacao> {
  Color cor = Colors.blue;
  double tamanho = 100;

  _ativarAnimacao() {
    setState(() {
      if (cor == Colors.blue && tamanho == 100) {
        cor = Colors.green;
        tamanho = 300;
      } else {
        cor = Colors.blue;
        tamanho = 100;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: Text("Animações com Flutter"),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: AnimatedContainer(
              duration: Duration(seconds: 2),
              width: tamanho,
              height: tamanho,
              color: cor),
        ),
        floatingActionButton: SizedBox(
          height: 100,
          width: 100,
          child: FloatingActionButton(
            onPressed: _ativarAnimacao,
            tooltip: 'Trocar',
            child: Icon(Icons.play_arrow),
            shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
          ),
        ));
  }
}
