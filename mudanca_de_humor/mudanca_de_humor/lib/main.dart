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
  // 0 = Feliz, 1 = Neutro, 2 = Bravo
  int humorAtual = 0;

  // Agora a função recebe qual botão foi clicado
  void mudarHumor(int novoHumor) {
    setState(() {
      humorAtual = novoHumor;
    });
  }

  @override
  Widget build(BuildContext context) {
    String emojiSelecionado = "😀";
    Color corDeFundo = Colors.white;
    Color corAppBar = Colors.blue;

    // Atualiza o visual com base no estado atual
    if (humorAtual == 0) {
      emojiSelecionado = "😀";
      corDeFundo = Colors.yellow[100]!;
      corAppBar = Colors.orange;
    } else if (humorAtual == 1) {
      emojiSelecionado = "😐";
      corDeFundo = Colors.grey[300]!;
      corAppBar = Colors.grey[700]!;
    } else {
      emojiSelecionado = "😡";
      corDeFundo = Colors.red[100]!;
      corAppBar = Colors.red;
    }

    return Scaffold(
      backgroundColor: corDeFundo,
      appBar: AppBar(
        backgroundColor: corAppBar,
        title: Text(
          "Botões de Humor",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              emojiSelecionado,
              style: TextStyle(fontSize: 120),
            ),
            
            SizedBox(height: 60), // Espaço entre o emoji e os botões
            
            // O widget Row coloca os itens lado a lado
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Espalha os botões por igual
              children: [
                // Botão Feliz
                ElevatedButton(
                  onPressed: () => mudarHumor(0),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                  child: Text("Feliz"),
                ),

                // Botão Neutro
                ElevatedButton(
                  onPressed: () => mudarHumor(1),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[700],
                    foregroundColor: Colors.white,
                  ),
                  child: Text("Neutro"),
                ),

                // Botão Bravo
                ElevatedButton(
                  onPressed: () => mudarHumor(2),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: Text("Bravo"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}