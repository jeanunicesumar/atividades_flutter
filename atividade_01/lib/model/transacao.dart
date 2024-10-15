class Transacao {
  late int _id;
  final String _nome;
  final double _valor;

  Transacao(this._id, this._nome, this._valor);

  Transacao.create(this._nome, this._valor);

  int getId() => _id;
  String getNome() => _nome;
  double getValor() => _valor;

  factory Transacao.fromJson(dynamic json) {
    return Transacao(json['id'], json['nome'], json['valor'].toDouble());
  }
}
