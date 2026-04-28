// lib/database_helper.dart


import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'item_model.dart'; // Importa o model 

class DatabaseHelper {
  static const _databaseName = "AppCadastro.db";
  static const table = 'dados';

  // Padrão Singleton: Garante que apenas uma conexão com o banco fique aberta
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  // Cria a tabela
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        titulo TEXT,
        descricao TEXT,
        data TEXT
      )
    ''');
  }

  // --- FUNÇÕES CRUD ---

  // [C]REATE (Inserir no banco)
  Future<int> insert(Item item) async {
    Database db = await instance.database;
    return await db.insert(table, item.toMap());
  }

  // [R]EAD (Ler do banco) + Bônus OrderBy (+1,0 pt)
  Future<List<Item>> queryAll() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      table,
      orderBy: "titulo ASC", // Ordena alfabeticamente
    );
    return List.generate(maps.length, (i) => Item.fromMap(maps[i]));
  }

  // [U]PDATE (Atualizar no banco)
  Future<int> update(Item item) async {
    Database db = await instance.database;
    return await db.update(table, item.toMap(), where: 'id = ?', whereArgs: [item.id]);
  }

  // [D]ELETE (Remover do banco)
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}