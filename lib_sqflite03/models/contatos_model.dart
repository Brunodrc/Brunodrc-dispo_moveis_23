class Contatos {
  int? id;
  final String name;
  String? avatar;
  final String phoNumber;
  final String email;

  Contatos({
    this.id,
    required this.name,
    this.avatar,
    required this.phoNumber,
    required this.email,
  });

  //metodo de converão para salvar no banco de dados
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
      'phoNumber': phoNumber,
      'email': email,
    };
  }

  // função de debug apenas
  @override
  String toString() {
    return 'Contato (id : $id, name: $name, avatar: $avatar, phoNumber: $phoNumber, e-mail: $email)';
  }
}
