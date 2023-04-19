class Contatos {
  int? id;
  final String name;
  final String email;

  Contatos({
    this.id,
    required this.name,
    required this.email,
  });

  //metodo de converão para salvar no banco de dados
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  // função de debug apenas
  @override
  String toString() {
    return 'Contato (id : $id, name: $name, e-mail: $email)';
  }
}
