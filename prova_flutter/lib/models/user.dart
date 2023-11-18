class User {
  int id;
  String usuario, senha;

  User({
    required this.id,
    required this.usuario,
    required this.senha,
  });

  static User fromJson(Map<dynamic, dynamic> userItem) {
    return User(
      id: int.parse(userItem['id']),
      usuario: userItem['usuario'] as String,
      senha: userItem['senha'] as String,
    );
  }
}
