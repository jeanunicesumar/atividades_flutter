import 'package:atividade_01/model/transacao.dart';
import 'package:atividade_01/service/transacao/transacao_service.dart';
import 'package:flutter/material.dart';

class TransacaoForm extends StatefulWidget {
  const TransacaoForm({super.key});

  @override
  State<StatefulWidget> createState() => TransacaoFormState();
}

class TransacaoFormState extends State<TransacaoForm> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController valorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Row(
          children: [
            TextFormField(
              controller: nomeController,
            ),
            TextFormField(
              controller: valorController,
            ),
            ElevatedButton(
                onPressed: () {
                  TransacaoService().create(Transacao.create(
                      nomeController.text, double.parse(valorController.text)));
                },
                child: const Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}
