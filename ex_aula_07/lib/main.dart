import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: TelaInicial()));
}

//---------------------------------
//           TELA 1
//---------------------------------

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Contatos"),
        backgroundColor: Colors.blue,
      ),

      //---------- Table de Contatos ----------
      body: Center(
        child: DataTable(
          columns: const [
            DataColumn(
              label: Text(
                "Nome",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                "Ação",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
          rows: [

            //---------- Contato 1 ----------
            DataRow(
              cells: [
                DataCell(
                  Row(
                    children: [
                      Icon(Icons.person, color: Colors.purple),
                      SizedBox(width: 8),
                      Text("Ana Silva"),
                    ],
                  ),
                ),
                DataCell(
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text("Ver"),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SegundaTela(
                          nome: "Ana Silva",
                          telefone: "(11) 1111-1111",
                          corTema: Colors.purple,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //---------- Contato 2 ----------
            DataRow(
              cells: [
                DataCell(
                  Row(
                    children: [
                      Icon(Icons.person, color: Colors.orange),
                      SizedBox(width: 8),
                      Text("Bruno Souza"),
                    ],
                  ),
                ),
                DataCell(
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text("Ver"),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SegundaTela(
                          nome: "Bruno Souza",
                          telefone: "(22) 2222-2222",
                          corTema: Colors.orange, 
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //---------- Contato 3 ----------
            DataRow(
              cells: [
                DataCell(
                  Row(
                    children: [
                      Icon(Icons.person, color: Colors.red),
                      SizedBox(width: 8),
                      Text("Carlos Mendes"),
                    ],
                  ),
                ),
                DataCell(
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text("Ver"),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SegundaTela(
                          nome: "Carlos Mendes",
                          telefone: "(33) 3333-3333",
                          corTema: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ---------- Melhorando a repetição ----------
// Poderia ser feito assim tbm:
// rows: [
//             _criarLinhaContato(context, "Ana Silva", "(11) 1111-1111", Colors.purple),
//             _criarLinhaContato(context, "Bruno Souza", "(22) 2222-2222", Colors.orange),
//             _criarLinhaContato(context, "Carlos Mendes", "(33) 3333-3333", Colors.red),

//---------------------------------
//           TELA 2
//---------------------------------

class SegundaTela extends StatelessWidget {
  final String nome;
  final String telefone;
  final Color corTema;

  SegundaTela({required this.nome, required this.telefone, required this.corTema});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalhes"), backgroundColor: corTema),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_circle, size: 80, color: corTema),
            SizedBox(height: 20),

            Text(
              "Nome: $nome",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Telefone: $telefone", style: TextStyle(fontSize: 22)),
            SizedBox(height: 40),

            //---------- Botão LIGAR ---------
            ElevatedButton.icon(
              icon: Icon(Icons.phone),
              label: Text("Ligar"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Ligando para $nome... ☎️"),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
            SizedBox(height: 20),

            //---------- Botão VOLTAR ---------
            ElevatedButton(
              child: Text("Voltar"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}