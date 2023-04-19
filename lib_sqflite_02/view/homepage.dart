import 'package:atv_01_sqflite/models/contatos_model.dart';
import 'package:atv_01_sqflite/models/db_model.dart';
import 'package:atv_01_sqflite/widgets/userinput.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //aqui é onde os 2 widgets podem se comunicar
  var db = DatabaseConnect();

  void addContact(Contatos contato) async {
    await db.insertContatos(contato);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo contato'),
      ),
      body: Column(
        children: [
          UserInput(createContact: addContact),
        ],
      ),
    );
  }
}
