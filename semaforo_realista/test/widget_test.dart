import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// O import continua igual ao nome do seu projeto
import 'package:semaforo_realista/main.dart';

// =================================
// TESTE DO SEMÁFORO
// =================================

void main() {
  testWidgets('Teste de renderização do Semáforo', (WidgetTester tester) async {
    // 1. Constrói o nosso app de Semáforo
    await tester.pumpWidget(MaterialApp(
      home: SemaforoApp(),
    ));

    // 2. Verifica se o botão principal está na tela
    expect(find.text('Mudar Semáforo'), findsOneWidget);

    // 3. Verifica o estado inicial (Estado 0 = Verde para carros, Pedestre Aguarda)
    expect(find.text('PEDESTRE: AGUARDE'), findsOneWidget);

    // 4. Simula um toque no botão de mudar o semáforo
    await tester.tap(find.text('Mudar Semáforo'));
    await tester.pump(); // Atualiza a tela após o clique

    // 5. Após 1 clique (Estado 1 = Amarelo para carros), o pedestre ainda aguarda
    expect(find.text('PEDESTRE: AGUARDE'), findsOneWidget);

    // 6. Simula um segundo toque no botão
    await tester.tap(find.text('Mudar Semáforo'));
    await tester.pump(); 

    // 7. Após 2 cliques (Estado 2 = Vermelho para carros), pedestre atravessa!
    expect(find.text('PEDESTRE: ATRAVESSE'), findsOneWidget);
  });
}