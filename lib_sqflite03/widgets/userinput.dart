import 'package:atv_01_sqflite/models/contatos_model.dart';
import 'package:flutter/material.dart';

import '../view/Allcontactspage.dart';

// ignore: must_be_immutable
class UserInput extends StatelessWidget {
  TextEditingController nameInput = TextEditingController();
  TextEditingController avatarInput = TextEditingController();
  TextEditingController phoneInput = TextEditingController();
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
          TextFormField(
            controller: avatarInput,
            maxLength: 40,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              icon: Icon(Icons.image_search),
              labelText: 'Avatar',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: phoneInput,
            maxLength: 40,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              icon: Icon(Icons.phone_android),
              labelText: 'Telefone',
              border: OutlineInputBorder(),
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
              keyboardType: TextInputType.emailAddress,
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
                avatar: avatarInput.text,
                phoNumber: phoneInput.text,
                email: emailInput.text,
              );
              createContact(myContact);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Allcontactspage()));
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
