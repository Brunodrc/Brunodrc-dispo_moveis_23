import 'package:atv_01_sqflite/models/db_model.dart';
import 'package:atv_01_sqflite/widgets/contactcard.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListContacts extends StatelessWidget {
  final Function createContact;
  final Function deleteContact;
  var db = DatabaseConnect();
  ListContacts(
      {required this.createContact, required this.deleteContact, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: db.getContatos(),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          var data = snapshot.data;
          var datalength = data!.length;

          return datalength == 0
              ? const Center(
                  child: Text('Sem contatos.'),
                )
              : ListView.builder(
                  itemCount: datalength,
                  itemBuilder: (context, i) => ContactCard(
                    id: data[i].id,
                    name: data[i].name,
                    email: data[i].email,
                    createContact: createContact,
                    deleteContact: deleteContact,
                  ),
                );
        },
      ),
    );
  }
}
