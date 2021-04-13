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
  final altura = TextEditingController();
  final peso = TextEditingController();
  String valorAltura = "";
  String resultado = "Preencha os campos e calcule";

  String resultadoIMC(double IMC) {
    if (IMC >= 16 && IMC <= 18.5) {
      return "Magreza Grave";
    } else if (IMC > 18.5 && IMC <= 25) {
      return "Peso Normal";
    } else if (IMC > 25 && IMC <= 30) {
      return "Sobrepeso";
    } else if (IMC > 30 && IMC <= 35) {
      return "Obesidade Grau I";
    } else if (IMC > 35 && IMC <= 40) {
      return "Obesidade Grau II";
    } else if (IMC <= 40) {
      return "Obesidade Grau III";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        shadowColor: Colors.deepOrange,
        title: Text("IMC"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Calculo IMC",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 40.0,
            ),
            TextField(
                controller: altura,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite a altura (exemplo: 1.70)',
                )),
            SizedBox(
              height: 20.0,
            ),
            TextField(
                controller: peso,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite o peso (exemplo: 55)',
                )),
            SizedBox(
              height: 40.0,
            ),
            FlatButton(
              child: Text("Calcular"),
              color: Colors.deepOrange,
              onPressed: () {
                setState(() {
                  final alturaTotal =
                      double.parse(altura.text) * double.parse(altura.text);
                  valorAltura = "$alturaTotal";
                });
                setState(() {
                  final calculoIMC =
                      double.parse(peso.text) / double.parse("$valorAltura");
                  resultado = resultadoIMC(calculoIMC);
                });
              },
              textColor: Colors.white,
            ),
            SizedBox(
              height: 40.0,
            ),
            Text("Resultado IMC: $resultado",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
