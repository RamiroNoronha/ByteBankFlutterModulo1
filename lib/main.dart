import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            ListaTransferencias(ItemTransferencia(100.0, 1000)),
            ListaTransferencias(ItemTransferencia(200.0, 1223)),
            ListaTransferencias(ItemTransferencia(300.0, 4231)),
          ],
        ),
        appBar: AppBar(
          title: Text(
            "Transferências",
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    ),
  );
}

class ListaTransferencias extends StatelessWidget {
  final ItemTransferencia _tranferencia;

  const ListaTransferencias(this._tranferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text("Valor: " + _tranferencia.valorTransferencia.toString()),
        subtitle: Text("Conta: " + _tranferencia.numeroConta.toString()),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final double valorTransferencia;
  final int numeroConta;

  const ItemTransferencia(this.valorTransferencia, this.numeroConta);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
