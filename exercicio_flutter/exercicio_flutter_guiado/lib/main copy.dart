//Estrutura inicial
//Main
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//MyApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: TodoPage());
  }
}

//Criando a Tela com Estado
//To Do Page
class TodoPage extends StatefulWidget {
  const TodoPage({super.key});
  @override
  State<TodoPage> createState() => _TodoPageState();
}

//Classe State
class _TodoPageState extends State<TodoPage> {
  //Criando o Estado
  //Lista
  final List<String> todoList = []; //Guarda os dados que vão mudar
  //Passo 5 – Criar o Controller
  final TextEditingController controller = TextEditingController();
// ||||| Adicionar |||||
  void adicionarTarefa() {
  setState(() {
    todoList.add(controller.text);
  });
  controller.clear();
}
// ||||| Remover |||||
void removerTarefa(int index) {
  setState(() {
    todoList.removeAt(index); // Remove o item da posição específica
  });
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("**To_Do**")),
      //Layout
      body: Column(
        children: [
          TextField(
            controller: controller,
          ),
          ElevatedButton(
            onPressed: adicionarTarefa, // Faltou algo aqui então definí uma função ao botão -- M.A.
            child: const Text("Adicionar"),
          ),
          Expanded(
  child: ListView.builder(
    itemCount: todoList.length, // Pega o tamanho da lista
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(todoList[index]), // Exibe o texto de cada posição
        trailing: IconButton(  // Chamar o excluir
          icon: const Icon(Icons.delete),
          onPressed: () => removerTarefa(index),
        ),
      );
    },
  ),
),
        ],
      ),
    );
  }
}