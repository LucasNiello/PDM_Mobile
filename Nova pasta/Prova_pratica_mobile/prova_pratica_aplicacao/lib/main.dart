// lib/main.dart

import 'package:flutter/material.dart';
import 'item_model.dart';
import 'database_helper.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App de Cadastro',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Item> _itens = [];

  @override
  void initState() {
    super.initState();
    _carregarItens();
  }

  // Lê o banco (READ) e atualiza a tela
  void _carregarItens() async {
    final itensDoBanco = await DatabaseHelper.instance.queryAll();
    setState(() {
      _itens = itensDoBanco;
    });
  }

  // Remove o item (DELETE) pelo ID e recarrega a tela
  void _removerItem(int id) async {
    await DatabaseHelper.instance.delete(id);
    _carregarItens();
  }

  // POP-UP (DIALOG) para criar ou editar um item
  void _mostrarCaixaDialogo({Item? item}) {
    // Controladores para os campos de texto
    final tituloController = TextEditingController();
    final descricaoController = TextEditingController();

    // Se veio um item (Edição), preenchemos os campos com os dados dele
    if (item != null) {
      tituloController.text = item.titulo; 
      descricaoController.text = item.descricao;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(item == null ? 'Novo Cadastro' : 'Editar Item'),
        content: Column(
          mainAxisSize: MainAxisSize.min, // Faz a caixinha ficar do tamanho do conteúdo
          children: [
            TextField(
              controller: tituloController,
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: descricaoController,
              decoration: const InputDecoration(labelText: 'Descrição'),
            ),
          ],
        ),
        actions: [
          // Botão Cancelar
          TextButton(
            onPressed: () => Navigator.pop(context), // Apenas fecha a caixinha
            child: const Text('Cancelar'),
          ),
          // Botão Salvar
          ElevatedButton(
            onPressed: () async {
              String dataAtual = DateTime.now().toIso8601String().split('T')[0];

              Item novoItem = Item(
                id: item?.id, // Mantém o ID se for edição
                titulo: tituloController.text,
                descricao: descricaoController.text,
                data: dataAtual,
              );

              if (item == null) {
                await DatabaseHelper.instance.insert(novoItem); // CREATE
              } else {
                await DatabaseHelper.instance.update(novoItem); // UPDATE
              }

              _carregarItens(); // Atualiza a lista por trás
              if(mounted) Navigator.pop(context); // Fecha a caixinha
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Cadastros')),
      // Bônus: Mensagem se a lista estiver vazia
      body: _itens.isEmpty
          ? const Center(
              child: Text('Nenhum item cadastrado', style: TextStyle(fontSize: 18)),
            )
          // Listagem normal
          : ListView.builder(
              itemCount: _itens.length,
              itemBuilder: (context, index) {
                final item = _itens[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(item.titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('${item.descricao}\nData: ${item.data}'),
                    isThreeLine: true,
                    // Aqui estão os nossos dois botões organizados!
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // 1. Botão Editar (UPDATE)
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => _mostrarCaixaDialogo(item: item),
                        ),
                        // 2. Botão Excluir (DELETE)
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _removerItem(item.id!),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      // Botão Flutuante que abre a Caixinha para Cadastro (CREATE)
      floatingActionButton: FloatingActionButton(
        onPressed: () => _mostrarCaixaDialogo(), 
        child: const Icon(Icons.add),
      ),
    );
  }
}