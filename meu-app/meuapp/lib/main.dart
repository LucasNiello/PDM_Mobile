import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Main application widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // App bar with title
        appBar: AppBar(
          title: Text('Lista de tarefas'),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          titleTextStyle: const TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),
        ),
        // Body with list of tasks
        body: ListView(
          children: [
            // Task 1
            ListTile(
              leading: Icon(Icons.radio_button_unchecked),
              title: Text('Estudar Fluter'),
              trailing: Icon(Icons.delete),
            ),
            // Task 2
            ListTile(
              leading: Icon(Icons.radio_button_unchecked),
              title: Text('Praticar Dart'),
              trailing: Icon(Icons.delete),
            ),
            // Task 3
            ListTile(
              leading: Icon(Icons.radio_button_unchecked),
              title: Text('Criar um App'),
              trailing: Icon(Icons.delete),
            ),
          ],
        ),
        // Add button
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.black,    
          
        ),
        // TODO: Uncomment if needed
        // Center(
        //   child: Text('Olá Mundo'),
        // ),
      ),
    );
  }
}
