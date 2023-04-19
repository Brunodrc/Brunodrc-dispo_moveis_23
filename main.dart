import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cálculo Álcool x Gasolina',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: MyHomePage(title: 'Cálculo Álcool x Gasolina'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //funções para capturar o input
  final TextEditingController _alcoolController = TextEditingController();
  final TextEditingController _gasolinaController = TextEditingController();

  double? _resultado;
  String _vantagem = '';

  //função para calcular o preço da gasolina sobre o alcool e
  void _calcular() {
    //recebe o valor de input passa para doble e checa se o valor do input é nulo ou nao
    double alcool = double.tryParse(_alcoolController.text) ?? 0;
    double gasolina = double.tryParse(_gasolinaController.text) ?? 0;

    if (alcool <= 0 || gasolina <= 0) {
      _resultado = null;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Atenção!!!"),
            content: Text(
                "Por favor, digite novamente os valores. \nDigite com ponto no lugar da vírgula."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      double proporcao = alcool / gasolina;
      if (proporcao < 0.7) {
        _vantagem = 'o alcool é vantajoso';
        _resultado = proporcao;
      } else {
        _vantagem = "a gasolina é mais vantajosa";
        _resultado = proporcao;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/gas_bomba.png',
              height: 110,
            ),
            TextField(
              controller: _alcoolController,
              decoration: InputDecoration(
                hintText: 'Preço do álcool',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _gasolinaController,
              decoration: InputDecoration(
                hintText: 'Preço da gasolina',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: _calcular,
              child: Text('Calcular'),
            ),
            _resultado == null
                ? SizedBox.shrink()
                : Text(
                    'Álcool é ${(_resultado! * 100).toStringAsFixed(0)}% do valor da gasolina. Então, $_vantagem .',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
          ],
        ),
      ),
    );
  }
}
