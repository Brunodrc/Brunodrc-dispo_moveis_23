import 'package:atv_01_sqflite/models/contatos_model.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatefulWidget {
  final int id;
  final String name;
  final String email;
  final Function createContact;
  final Function deleteContact;

  const ContactCard(
      {required this.id,
      required this.name,
      required this.email,
      required this.createContact,
      required this.deleteContact,
      super.key});

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  @override
  Widget build(BuildContext context) {
    var outroContact =
        Contatos(id: widget.id, name: widget.name, email: widget.email);
    return Card(
      child: Expanded(
          child: Row(
        children: [
          const Icon(
            Icons.person_2_outlined,
          ),
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
                  widget.email,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xFF8F8F8F)),
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
