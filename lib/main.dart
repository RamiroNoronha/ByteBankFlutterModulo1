import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTranferencia(),
      ),
    );
  }
}

class FormularioTranferencia extends StatelessWidget {
  FormularioTranferencia({Key? key}) : super(key: key);
  final TextEditingController controladorNumeroDaConta =
      TextEditingController();
  final TextEditingController controladorValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tranferências"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: controladorNumeroDaConta,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                labelText: "Numero da Conta",
                hintText: "0000",
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: TextField(
              controller: controladorValor,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                labelText: "Valor",
                hintText: "0.00",
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                debugPrint("Clicou no confirmar");
                final int? numeroConta =
                    int.tryParse(controladorNumeroDaConta.text);
                final double? valor = double.tryParse(controladorValor.text);

                if (numeroConta != null && valor != null) {
                  final transferenciaCriada = Transferencia(valor, numeroConta);
                  debugPrint(transferenciaCriada.toString());
                }
              },
              child: Text("Confirmar")),
        ],
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Transferências",
        ),
      ),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(100.0, 1000)),
          ItemTransferencia(Transferencia(200.0, 1223)),
          ItemTransferencia(Transferencia(300.0, 4231)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  const ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text("Valor: " + _transferencia.valorTransferencia.toString()),
        subtitle: Text("Conta: " + _transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valorTransferencia;
  final int numeroConta;
  const Transferencia(this.valorTransferencia, this.numeroConta);

  @override
  String toString() {
    // TODO: implement toString
    return 'valor = $valorTransferencia / numeroConta = $numeroConta';
  }
}
