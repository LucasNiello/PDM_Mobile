import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Import atualizado para o novo nome do seu projeto!
import 'package:pedra_papel_tesoura/main.dart'; 

// =================================
// TESTE DA AULA: PEDRA, PAPEL E TESOURA
// =================================

void main() {
  testWidgets('Testando a interface e o botão de reset da aula', (WidgetTester tester) async {
    // 1. Constrói o app na tela de teste
    await tester.pumpWidget(MaterialApp(
      home: JogoApp(),
    ));

    // 2. Verifica se os textos iniciais do Passo 3 e 8 estão na tela
    expect(find.text('Computador'), findsOneWidget);
    expect(find.text('Escolha uma opção'), findsOneWidget);
    expect(find.text('Você: 0 | PC: 0'), findsOneWidget);
    expect(find.byIcon(Icons.help_outline), findsOneWidget);

    // 3. Encontra o botão de "Pedra" pelo ícone (landscape) do Passo 8
    final botaoPedra = find.byIcon(Icons.landscape);
    
    // 4. Simula uma jogada (clicando na Pedra)
    await tester.tap(botaoPedra);
    await tester.pump(); // Atualiza a tela após a jogada

    // 5. Após jogar, o texto inicial deve sumir (dando lugar a Empate, Venceu ou Perdeu)
    expect(find.text('Escolha uma opção'), findsNothing);

    // 6. Simula o clique no botão "Resetar Placar" do Passo 9
    await tester.tap(find.text('Resetar Placar'));
    await tester.pump();

    // 7. Verifica se o placar voltou a zero e a mensagem de reset apareceu
    expect(find.text('Você: 0 | PC: 0'), findsOneWidget);
    expect(find.text('Placar zerado'), findsOneWidget); // Mensagem definida no reset
    expect(find.byIcon(Icons.help_outline), findsOneWidget); // Ícone deve voltar ao normal
  });
}