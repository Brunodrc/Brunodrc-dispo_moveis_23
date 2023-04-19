import 'package:atv_01_sqflite/models/contatos_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserInput extends StatelessWidget {
  TextEditingController nameInput = TextEditingController();
  TextEditingController emailInput = TextEditingController();
  final Function createContact;
  UserInput({required this.createContact, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          // ignore: avoid_unnecessary_containers
          Container(
            child: TextFormField(
              controller: nameInput,
              maxLength: 40,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // ignore: avoid_unnecessary_containers
          Container(
            child: TextFormField(
              controller: emailInput,
              maxLength: 40,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                icon: Icon(Icons.mail),
                labelText: 'e-mail',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              var myContact = Contatos(
                name: nameInput.text,
                email: emailInput.text,
              );
              createContact(myContact);
            },
            child: Container(
              width: double.maxFinite,
              height: 45,
              color: Colors.green,
              child: const Center(
                  child: Text(
                'Adicionar contato',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              )),
            ),
          )
        ],
      ),
    );
  }
}
