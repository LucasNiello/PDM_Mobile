import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:controle_temperatura/main.dart';

// =================================
// TESTE CONTROLE DE TEMPERATURA
// =================================

void main() {
  testWidgets('Teste de interação com a temperatura', (WidgetTester tester) async {
    // Inicializa o app de Temperatura
    await tester.pumpWidget(MaterialApp(
      home: TemperaturaApp(),
    ));

    // Verifica o estado inicial (20 °C e status "Agradável")
    expect(find.text('20 °C'), findsOneWidget);
    expect(find.text('Agradável'), findsOneWidget);

    // Simula um toque no botão de aumentar temperatura (+)
    await tester.tap(find.text('+'));
    await tester.pump(); // Atualiza a tela

    // Verifica se a temperatura subiu para 21 °C
    expect(find.text('20 °C'), findsNothing);
    expect(find.text('21 °C'), findsOneWidget);

    // Simula dois toques no botão de diminuir temperatura (-)
    await tester.tap(find.text('-'));
    await tester.tap(find.text('-'));
    await tester.pump(); // Atualiza a tela

    // Verifica se a temperatura desceu para 19 °C (21 - 1 - 1)
    expect(find.text('19 °C'), findsOneWidget);
  });
}