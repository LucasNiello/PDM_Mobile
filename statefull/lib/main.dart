import 'package:flutter/material.dart';

void main () {
  runApp (MaterialApp(
    home: PaginaContador()));
}

class PaginaContador extends StatefulWidget {
  /// Creates a const [PaginaContador] widget.
  ///
  /// The [key] parameter is used to control how one widget replaces another widget
  /// in the tree. See the documentation for [Key] for more details.
  const PaginaContador({super.key});
  
  @override
  State<PaginaContador> createState() => _PaginaContadorState();
}

class _PaginaContadorState extends State<PaginaContador> {
  int contador = 0;

  void increment() {
    setState(() {
      contador++;
    });
  }

  void decrement() {
    setState(() {
      contador--;
    });
  }

  void reset() {
    setState(() {
      contador = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu App Interativo'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Cliques: $contador', style: TextStyle(color: Colors.white, fontSize: 24)),
            ElevatedButton(
              style: ButtonStyle(
                textStyle: WidgetStateProperty.all(TextStyle(fontSize: 30)),
                backgroundColor: WidgetStateProperty.all(Colors.grey[300]),
              ),
              onPressed: increment,
              child: Text('Incrementar', style: TextStyle(color: Colors.black)),
            ),
            ElevatedButton(
              style: ButtonStyle(
                textStyle: WidgetStateProperty.all(TextStyle(fontSize: 30)),
                backgroundColor: WidgetStateProperty.all(Colors.grey[300]),
              ),
              onPressed: decrement,
              child: Text('Decrementar', style: TextStyle(color: Colors.black)),
            ),
            ElevatedButton(
              style: ButtonStyle(
                textStyle: WidgetStateProperty.all(TextStyle(fontSize: 30)),
                backgroundColor: WidgetStateProperty.all(Colors.grey[300]),
              ),
              onPressed: reset,
              child: Text('Resetar', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: decrement,
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.remove, color: Colors.black),
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            onPressed: increment,
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.add, color: Colors.black),
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            onPressed: reset,
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.refresh, color: Colors.black),
          ),
        ],
      ),
    );
  }
}