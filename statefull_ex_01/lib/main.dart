// Ex_01: Sorteador de números
// Crie um aplicativo Flutter que sorteie um número aleatório entre 1 e 10
// Criar variavel numero
// Criar função sortear()
//Usar setState
//Exibir na tela

//Dica: import 'dart:math' para usar a classe Random e gerar números aleatórios.

// ========================================================================
// SORTEADOR DE NÚMEROS
// ========================================================================

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int numero = 0;

  void sortear() {
    setState(() {
      numero = Random().nextInt(10) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sorteador')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Número: $numero', style: TextStyle(fontSize: 32)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: sortear,
              child: Text('Sortear'),
            ),
          ],
        ),
      ),
    );
  }
}