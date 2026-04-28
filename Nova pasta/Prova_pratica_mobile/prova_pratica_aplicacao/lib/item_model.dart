// lib/item_model.dart


class Item {
  int? id;
  String titulo;
  String descricao;
  String data; // Bônus (+2,0 pts): Campo data

  Item({this.id, required this.titulo, required this.descricao, required this.data});

  // CREATE | UPDATE
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'data': data,
    };
  }

  // READ
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      titulo: map['titulo'],
      descricao: map['descricao'],
      data: map['data'],
    );
  }
}