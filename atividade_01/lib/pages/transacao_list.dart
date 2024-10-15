import 'package:atividade_01/model/transacao.dart';
import 'package:atividade_01/pages/transacao_form.dart';
import 'package:atividade_01/service/transacao/transacao_service.dart';
import 'package:flutter/material.dart';

class TransacaoList extends StatefulWidget {
  const TransacaoList({super.key});

  @override
  State<StatefulWidget> createState() => TransacaoListState();
}

class TransacaoListState extends State<TransacaoList> {
  final Future<List<Transacao>> transacoes = TransacaoService().findAll();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Transacao>>(
          future: transacoes,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              final transacoes = snapshot.data!;
              return buildTransacoes(transacoes);
            } else {
              return const Text("No data available");
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(121, 34, 34, 34),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TransacaoForm()),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buildTransacoes(List<Transacao> transacoes) {
    return ListView.builder(
      itemCount: transacoes.length,
      itemBuilder: (context, index) {
        final transacao = transacoes[index];
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          width: double.maxFinite,
          child: Row(
            children: [
              Column(
                children: [
                  Text("Nome: ${transacao.getNome()}"),
                  Text("Valor: ${transacao.getValor()}"),
                  IconButton(
                    onPressed: () => {},
                    icon: const Icon(Icons.abc_rounded),
                  ),
                  IconButton(
                    onPressed: () => {
                      TransacaoService().delete(transacao.getId()),
                    },
                    icon: const Icon(Icons.abc),
                  ),
                ],
              ),
              const SizedBox(width: 10),
            ],
          ),
        );
      },
    );
  }
}
