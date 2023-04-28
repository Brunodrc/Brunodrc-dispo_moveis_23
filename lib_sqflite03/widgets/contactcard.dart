import 'package:atv_01_sqflite/models/contatos_model.dart';
import 'package:atv_01_sqflite/widgets/extractargs.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

// ignore: must_be_immutable
class ContactCard extends StatefulWidget {
  final int id;
  final String name;
  String? avatar;
  final String phoNumber;
  final String email;

  final Function deleteContact;

  ContactCard(
      {required this.id,
      required this.name,
      this.avatar,
      required this.phoNumber,
      required this.email,
      required this.deleteContact,
      super.key});

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  @override
  Widget build(BuildContext context) {
    var outroContact = Contatos(
        id: widget.id,
        name: widget.name,
        avatar: widget.avatar,
        phoNumber: widget.phoNumber,
        email: widget.email);
    return Card(
      child: Expanded(
          child: Row(
        children: [
          const Icon(Icons.person),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  widget.phoNumber,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xFF8F8F8F)),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  widget.email,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xFF8F8F8F)),
                ),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      ExtractArgumentsScreen.routeName,
                      arguments: Contatos(
                          id: widget.id,
                          name: widget.name,
                          avatar: widget.avatar,
                          phoNumber: widget.phoNumber,
                          email: widget.email),
                    );
                  },
                  child: const Text('Detalhes'),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              widget.deleteContact(outroContact);
            },
            icon: const Icon(Icons.close_sharp),
          )
        ],
      )),
    );
  }
}
