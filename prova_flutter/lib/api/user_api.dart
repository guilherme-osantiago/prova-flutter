import 'package:flutter/material.dart';
import 'package:prova_flutter/constants.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

/// Retorna 1 caso o login (usuario e senha) sejam válidos
Future<int> login(String usuario, String senha) async {
  int response = 0;
  Map<String, dynamic>? usersMap = await _loadUsers();
  if (usersMap != null) {
    var loginUser = usersMap.values
        .firstWhere((e) => e['usuario'] == usuario, orElse: () => null);
    if (loginUser != null) {
      if (loginUser['senha'] == senha) {
        response = 1;
      }
    }
  }
  return response;
}

// Carrega todos os usuários do database
Future<Map<String, dynamic>?> _loadUsers() async {
  Map<String, dynamic> map = {};

  final url = Uri.parse(mockApi);

  var response = await http.get(url);
  if (response.statusCode == 200) {
    List<dynamic> list = convert.jsonDecode(response.body);
    for (var user in list) {
      map[user['id']] = user;
    }
    return map;
  } else {
    debugPrint('Request fracassou com o status: ${response.statusCode}');
    return null;
  }
}
