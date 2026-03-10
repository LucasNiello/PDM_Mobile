import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: HumorApp()),
  );
}

class HumorApp extends StatefulWidget {
  @override
  _HumorAppState createState() => _HumorAppState();
}

class _HumorAppState extends State<HumorApp> {
  // Usamos um 'int' para representar os 3 estados:
  // 0 = Feliz, 1 = Neutro, 2 = Bravo
  int humorAtual = 0;

  void alternarHumor() {
    setState(() {
      // Se o humor for menor que 2, ele avança para o próximo.
      // Se chegar no 2 (Bravo), ele zera e volta pro 0 (Feliz).
      if (humorAtual < 2) {
        humorAtual++;
      } else {
        humorAtual = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Definimos variáveis locais que vão mudar dependendo do humorAtual.
    // Assim o código da interface lá embaixo fica bem limpo.
    String emojiSelecionado = "😀";
    String textoSelecionado = "Feliz";
    Color corDeFundo = Colors.white;
    Color corDoBotao = Colors.blue;

    if (humorAtual == 0) {
      emojiSelecionado = "😀";
      textoSelecionado = "Feliz";
      corDeFundo = Colors.yellow[100]!; // Fundo mais clarinho
      corDoBotao = Colors.orange;
    } else if (humorAtual == 1) {
      emojiSelecionado = "😐";
      textoSelecionado = "Neutro";
      corDeFundo = Colors.grey[300]!;
      corDoBotao = Colors.grey[700]!;
    } else {
      emojiSelecionado = "😡";
      textoSelecionado = "Bravo";
      corDeFundo = Colors.red[100]!;
      corDoBotao = Colors.red;
    }

    return Scaffold(
      backgroundColor: corDeFundo,
      appBar: AppBar(
        backgroundColor: corDoBotao,
        title: Text(
          "Botão de Humor",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text ao invés de icon por ser emoji
            Text(
              emojiSelecionado,
              style: TextStyle(fontSize: 120),
            ),
            
            SizedBox(height: 40), //separando o emoji do botão
            
            ElevatedButton(
              onPressed: alternarHumor,
              style: ElevatedButton.styleFrom(
                backgroundColor: corDoBotao,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text(
                textoSelecionado,
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}