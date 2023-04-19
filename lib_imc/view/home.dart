import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _pesoInput = TextEditingController();
  final TextEditingController _alturaInput = TextEditingController();

  double? _resultado;
  String? _message;

  void _calcular() {
    double peso = double.tryParse(_pesoInput.text) ?? 0;
    double altura = double.tryParse(_alturaInput.text) ?? 0;

    if (peso <= 0 || altura <= 0) {
      _resultado = null;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Atenção!!!"),
            content: Text(
                'Por favor, digite os valores novamente \ncom ponto no lugar da vírgula'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        },
      );
    } else {
      double imc = peso / (altura * altura);

      if (imc < 18.5) {
        _resultado = imc;
        _message = 'Você está abaixo do peso, procure um médico.';
      } else if (18.5 <= imc && imc <= 25) {
        _resultado = imc;
        _message = 'Você está com peso ideal, Parabéns!';
      } else if (imc >= 25 && imc < 30) {
        _resultado = imc;
        _message = 'Você está com sobrepeso, cuidado!';
      } else if (imc >= 34 && imc < 35) {
        _resultado = imc;
        _message = 'Você está com obesidade, procure um médico!';
      } else if (imc < 40 && imc >= 35) {
        _resultado = imc;
        _message =
            'Atenção, você está com obesidade grau 2, procure um médico!';
      } else {
        _resultado = imc;
        _message =
            'Atenção, você está com obesidade mórbida, procure um médico urgente!';
      }
      ;
      setState(() {});
    }
  }

  void _reload() {
    Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [IconButton(onPressed: _reload, icon: Icon(Icons.refresh))],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          fun_image(
            'https://imgs.search.brave.com/KWW1hPMOcUC9iST0ltYiiinOqhw4KLRHuv6NSTcyYi4/rs:fit:966:474:1/g:ce/aHR0cHM6Ly80LmJw/LmJsb2dzcG90LmNv/bS8tSUVMMjB3d0dM/ODgvVVdtb1pLa01H/SkkvQUFBQUFBQUFB/UzQvQjZuRW4xaW9R/UzQvczE2MDAvaW1j/KygxKS5wbmc',
          ),
          SizedBox(
            height: 20,
          ),
          input_text_fild('Peso em kg', _pesoInput),
          SizedBox(
            height: 20,
          ),
          input_text_fild('Altura em m', _alturaInput),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            child: ElevatedButton(
              onPressed: _calcular,
              child: Text(
                'Calcular',
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _resultado == null
              ? SizedBox.shrink()
              : Card(
                  color: Colors.yellow[50],
                  child: Center(
                      child: Text(
                    'Seu IMC é $_resultado. \n$_message',
                    style: TextStyle(fontSize: 30),
                  )),
                ),
        ]),
      ),
    );
  }
}

Widget fun_image(String link) {
  return Image.network(
    link,
    height: 170,
    alignment: Alignment.center,
  );
}

Widget input_text_fild(String textLabel, TextEditingController input) {
  return TextField(
    controller: input,
    keyboardType: TextInputType.number,
    textAlign: TextAlign.center,
    decoration: InputDecoration(
      labelText: textLabel,
      hintText: textLabel,
      border: OutlineInputBorder(),
    ),
  );
}
