import 'package:flutter/material.dart';

// =================================
// CONTROLE DE TEMPERATURA
// =================================

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TemperaturaApp(),
  ));
}

class TemperaturaApp extends StatefulWidget {
  @override
  _TemperaturaAppState createState() => _TemperaturaAppState();
}

class _TemperaturaAppState extends State<TemperaturaApp> {
  // Estado inicial da temperatura
  int temperatura = 20;

  // Função para aumentar a temperatura
  void aumentar() {
    setState(() {
      temperatura++;
    });
  }

  // Função para diminuir a temperatura
  void diminuir() {
    setState(() {
      temperatura--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Variáveis que controlam o visual com base no estado
    Color corFundo;
    IconData icone;
    String status;

    // Lógica para definir cor, ícone e texto de acordo com a temperatura
    if (temperatura < 15) {
      corFundo = Colors.blue;
      icone = Icons.ac_unit;
      status = "Frio";
    } else if (temperatura < 30) {
      corFundo = Colors.green;
      icone = Icons.wb_sunny;
      status = "Agradável";
    } else {
      corFundo = Colors.red;
      icone = Icons.local_fire_department;
      status = "Quente";
    }

    return Scaffold(
      backgroundColor: corFundo,
      appBar: AppBar(
        title: Text("Controle de Temperatura"),
        centerTitle: true,
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ícone representativo do clima
            Icon(
              icone,
              size: 100,
              color: Colors.white,
            ),
            
            SizedBox(height: 20),
            
            // Exibição do valor da temperatura
            Text(
              "$temperatura °C",
              style: TextStyle(
                fontSize: 40, 
                fontWeight: FontWeight.bold, 
                color: Colors.white
              ),
            ),
            
            // Texto informando o status (Frio, Agradável ou Quente)
            Text(
              status,
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
            
            SizedBox(height: 40),
            
            // Botões de controle (+ e -)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: diminuir,
                  child: Text("-", style: TextStyle(fontSize: 24)),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: aumentar,
                  child: Text("+", style: TextStyle(fontSize: 24)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}