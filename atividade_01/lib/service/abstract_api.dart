import 'dart:convert';

import 'package:atividade_01/model/transacao.dart';
import 'package:http/http.dart' as http;

abstract class AbstractApi {
  final String url = "http://localhost:3000/transacoes";

  Future<List<Transacao>> findAll() async {
    var response = await (http.get(Uri.parse(url)));
    List<dynamic> data = await (jsonDecode(response.body));
    return data.map((json) => Transacao.fromJson(json)).toList();
  }

  Future<Transacao> findById(int id) async {
    var response = await (http.get(Uri.parse('$url/{id}')));
    dynamic json = (jsonDecode(response.body));
    return Transacao.fromJson(json);
  }

  Future<void> create(Transacao body) async {
    http.post(Uri.parse(url), body: jsonEncode(body));
  }

  Future<void> update(int id, Transacao body) async {
    http.put(Uri.parse('$url/{id}'), body: jsonEncode(body));
  }

  Future<void> delete(int id) async {
    http.delete(Uri.parse('$url/{id}'));
  }
}
