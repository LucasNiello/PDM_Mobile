import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Tira a faixa de debug
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String resultado = 'Nenhum número sorteado';
  final TextEditingController _controller = TextEditingController();

  void sortear() {
    String textoDigitado = _controller.text.trim();
    List<int> numerosSorteio = [];

    // Se o campo estiver vazio, avisa o usuário e para por aqui
    if (textoDigitado.isEmpty) {
      setState(() {
        resultado = 'Por favor, digite os números!';
      });
      return;
    }

    try {
      // Cenário 1: O usuário digitou um intervalo, ex: 1-40
      if (textoDigitado.contains('-')) {
        List<String> partes = textoDigitado.split('-');
        int inicio = int.parse(partes[0].trim());
        int fim = int.parse(partes[1].trim());

        // Garante que o menor número seja o início
        int menor = min(inicio, fim);
        int maior = max(inicio, fim);

        // Gera a lista do menor ao maior
        for (int i = menor; i <= maior; i++) {
          numerosSorteio.add(i);
        }
      } 
      // Cenário 2: O usuário digitou números específicos, ex: 3, 5, 14
      else {
        List<String> partes = textoDigitado.split(',');
        for (String parte in partes) {
          String numeroLimpo = parte.trim();
          if (numeroLimpo.isNotEmpty) { 
            numerosSorteio.add(int.parse(numeroLimpo));
          }
        }
      }

      // Faz o sorteio final
      if (numerosSorteio.isNotEmpty) {
        int indiceSorteado = Random().nextInt(numerosSorteio.length);
        int numeroEscolhido = numerosSorteio[indiceSorteado];
        
        setState(() {
          resultado = 'Número Sorteado: $numeroEscolhido';
        });
      }

    } catch (e) {
      // Trata erros de digitação sem quebrar o app
      setState(() {
        resultado = 'Formato inválido! Use "1-40" ou "3, 5, 14"';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sorteador')),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  resultado,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: _controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Insira os numeros para sorteio',
                    hintText: 'Ex: 1-40  OU  3, 5, 14',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: sortear,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: const Text('Sortear Número', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}