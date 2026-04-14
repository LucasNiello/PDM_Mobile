import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, // Corrigido aqui
    home: AppBanco(), // Nome da classe corrigido
  ));
}

class AppBanco extends StatefulWidget {
  @override
  _AppBancoState createState() => _AppBancoState();
}

class _AppBancoState extends State<AppBanco> {
  TextEditingController controller = TextEditingController();
  List<Map<String, dynamic>> tarefas = []; // Map com "M" maiúsculo

  Future<Database> criarBanco() async {
    final caminho = await getDatabasesPath();
    final path = join(caminho, "banco.db");

    return openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE tarefas(id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT)",
        );
      },
      version: 1,
    );
  }

  Future<void> inserirTarefa(String nome) async {
    if (nome.isEmpty) return; 
    final db = await criarBanco();
    await db.insert("tarefas", {"nome": nome});
    carregarTarefas();
  }

  Future<void> carregarTarefas() async {
    final db = await criarBanco();
    final List<Map<String, dynamic>> lista = await db.query("tarefas");

    setState(() {
      tarefas = lista;
    });
  }

  Future<void> excluirTarefa(int id) async { // Nome da função
    final db = await criarBanco();
    await db.delete(
      "tarefas",
      where: "id = ?",
      whereArgs: [id],
    );
    carregarTarefas();
  }

  @override
  void initState() {
    super.initState();
    carregarTarefas();
  }

  @override
  Widget build(BuildContext context) { // Widget com "W" maiúsculo
    return Scaffold(
      appBar: AppBar(title: Text("Banco de Dados")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10), // Removido o "padding:" extra
            child: TextField(
              controller: controller, // Corrigido de "copntroller"
              decoration: InputDecoration(
                labelText: "Nova tarefa",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              inserirTarefa(controller.text);
              controller.clear();
            },
            child: Text("Adicionar"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tarefas.length,
              itemBuilder: (context, index) {
                return ListTile( // Corrigido de "ListTitle"
                  title: Text(tarefas[index]["nome"]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      excluirTarefa(tarefas[index]["id"]); // Nome corrigido
                    },
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