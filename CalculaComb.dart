import 'package:flutter/material.dart';

void main() async {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final valorEtanol = TextEditingController();
  final valorGasolina = TextEditingController();
  String valorCompensa = "";

  String compensaMais(double compensa) {
    if (compensa > 0.70) {
      return "Gasolina";
    } else {
      return "Etanol";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Combustível"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40.0,
            ),
            Text("Digite o valor do Etanol:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            TextField(
                controller: valorEtanol,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Valor em litros',
                )),
            SizedBox(
              height: 40.0,
            ),
            Text("Digite o valor da Gasolina:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            TextField(
                controller: valorGasolina,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Valor em litros',
                )),
            SizedBox(
              height: 40.0,
            ),
            FlatButton(
              child: Text("Calcular"),
              color: Colors.lightBlue,
              onPressed: () {
                setState(() {
                  final resultadoCompensa = double.parse(valorEtanol.text) /
                      double.parse(valorGasolina.text);
                  valorCompensa = compensaMais(resultadoCompensa);
                });
              },
              textColor: Colors.white,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text("Compensa usar: $valorCompensa",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
