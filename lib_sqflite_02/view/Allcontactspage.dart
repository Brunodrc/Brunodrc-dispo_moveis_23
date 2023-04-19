import 'package:atv_01_sqflite/models/db_model.dart';
import 'package:atv_01_sqflite/widgets/contactlilst.dart';
import 'package:flutter/material.dart';

import '../models/contatos_model.dart';

class Allcontactspage extends StatefulWidget {
  const Allcontactspage({super.key});

  @override
  State<Allcontactspage> createState() => _AllcontactspageState();
}

class _AllcontactspageState extends State<Allcontactspage> {
  var db = DatabaseConnect();

  void addContact(Contatos contato) async {
    await db.insertContatos(contato);
    setState(() {});
  }

  //deletar contato
  void deleteContact(Contatos contato) async {
    await db.deleteContatos(contato);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Meus Contatos')),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            icon: Icon(Icons.home_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          ListContacts(createContact: addContact, deleteContact: deleteContact),
        ],
      ),
    );
  }
}
