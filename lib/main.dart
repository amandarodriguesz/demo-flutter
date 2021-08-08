import 'package:flutter/material.dart';
import 'Home.dart';
import 'Animacao.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    routes: <String, WidgetBuilder>{'a/': (BuildContext context) => Animacao()},
  ));
}
