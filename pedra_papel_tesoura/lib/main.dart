// PASSO 1 e 2 - Estrutura básica e importação da biblioteca math
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: JogoApp(), // Preenchido: Chama a classe principal
  ));
}

class JogoApp extends StatefulWidget { // Preenchido: StatefulWidget para tela dinâmica
  @override
  _JogoAppState createState() => _JogoAppState();
}

// PASSO 3 - Variáveis
class _JogoAppState extends State<JogoApp> {
  // Ícone inicial com ponto de interrogação
  IconData iconeComputador = Icons.help_outline; 
  String resultado = "Escolha uma opção";
  int pontosJogador = 0; // Inicia com zero
  int pontosComputador = 0; // Inicia com zero
  List opcoes = ["pedra", "papel", "tesoura"];

  // PASSO 4 - Função Jogar
  void jogar(String escolhaUsuario) {
    // Sorteia um número de 0 a 2
    var numero = Random().nextInt(3); 
    var escolhaComputador = opcoes[numero];

    // Tudo que muda a tela precisa estar dentro do setState
    setState(() {
      
      // PASSO 5 - Mostrar Escolha do Computador
      if (escolhaComputador == "pedra") {
        iconeComputador = Icons.landscape; // Ícone da pedra
      }
      if (escolhaComputador == "papel") {
        iconeComputador = Icons.pan_tool;
      }
      if (escolhaComputador == "tesoura") {
        iconeComputador = Icons.content_cut;
      }

      // PASSO 6 - Lógica do Jogo (Quem ganha a rodada)
      if (escolhaUsuario == escolhaComputador) {
        resultado = "Empate";
      } 
      else if (
          (escolhaUsuario == "pedra" && escolhaComputador == "tesoura") ||
          (escolhaUsuario == "papel" && escolhaComputador == "pedra") ||
          (escolhaUsuario == "tesoura" && escolhaComputador == "papel")) {
        
        pontosJogador++;
        resultado = "Você venceu!";
        
        // PASSO 7 - Campeonato com 5 Pontos (Jogador)
        if (pontosJogador == 5) {
          resultado = "🏆 Você ganhou o campeonato!";
          pontosJogador = 0;
          pontosComputador = 0;
        }
      } 
      else {
        pontosComputador++;
        resultado = "Computador venceu!";
        
        // (Adição necessária para não quebrar caso o PC ganhe)
        if (pontosComputador == 5) {
          resultado = "💻 Computador ganhou o campeonato!";
          pontosJogador = 0;
          pontosComputador = 0;
        }
      }
    });
  }

  // PASSO 9 - Função para o Botão Resetar Placar
  void resetarPlacar() {
    setState(() {
      pontosJogador = 0;
      pontosComputador = 0;
      resultado = "Placar zerado";
      iconeComputador = Icons.help_outline; // Volta o ícone pro estado inicial
    });
  }

  // PASSO 8 - Interface do App
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedra Papel Tesoura"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Computador"),
            Icon(
              iconeComputador,
              size: 100,
            ),
            Text(
              resultado,
              style: TextStyle(fontSize: 26),
            ),
            Text(
              "Você: $pontosJogador | PC: $pontosComputador",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.landscape),
                  onPressed: () => jogar("pedra"),
                ),
                IconButton(
                  icon: Icon(Icons.pan_tool),
                  onPressed: () => jogar("papel"),
                ),
                IconButton(
                  icon: Icon(Icons.content_cut),
                  onPressed: () => jogar("tesoura"),
                ),
              ],
            ),
            // Adicionando o botão do PASSO 9 na interface
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: resetarPlacar,
              icon: Icon(Icons.refresh),
              label: Text("Resetar Placar"),
            )
          ],
        ),
      ),
    );
  }
}