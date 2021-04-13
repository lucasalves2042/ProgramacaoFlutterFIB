import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.purple,
      ),
      title: "App",
      home: Tela1(),
    ));

class Tela1 extends StatelessWidget {
  final valorReal = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.purple,
              title: Text("Conversor de Moeda"),
            ),
            body: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 40.0,
                  ),
                  TextField(
                      controller: valorReal,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusColor: Colors.purple,
                        labelText: 'R\$ valor em reais',
                      )),
                  SizedBox(
                    height: 40.0,
                  ),
                  RaisedButton(
                    child: Text('Converter'),
                    color: Colors.purple,
                    textColor: Colors.white,
                    onPressed: () {
                      final double valorDolar =
                          5.75 * double.parse(valorReal.text);
                      final double valorEuro =
                          6.83 * double.parse(valorReal.text);
                      final double valorLibra =
                          7.88 * double.parse(valorReal.text);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Tela2(valorDolar, valorEuro, valorLibra)),
                      );
                    },
                  ),
                ],
              ),
            )));
  }
}

class Tela2 extends StatelessWidget {
  final double valorDolar;
  final double valorEuro;
  final double valorLibra;

  Tela2(this.valorDolar, this.valorEuro, this.valorLibra);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Resultado"),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40.0,
              ),
              Text("Dolar: \$$valorDolar",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 40.0,
              ),
              Text("Euro: €$valorEuro",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 40.0,
              ),
              Text("Libra: £$valorLibra",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 40.0,
              ),
            ],
          ),
        ));
  }
}
