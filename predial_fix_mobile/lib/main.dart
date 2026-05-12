import 'package:flutter/material.dart';
import 'screens/login_screen.dart'; // Vamos criar este arquivo agora

void main() {
  runApp(const PredialFixApp());
}

class PredialFixApp extends StatelessWidget {
  const PredialFixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PredialFix',
      theme: ThemeData(
        // Definindo a cor principal baseada no SENAI
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const LoginScreen(),
    );
  }
}