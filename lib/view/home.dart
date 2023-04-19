import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mvc_app_1/model/contactsModel.dart';
import 'package:mvc_app_1/view/page2.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/personModel.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Person person = ;
  TextEditingController nameInput = TextEditingController();
  TextEditingController emailInput = TextEditingController();
  TextEditingController phoneInput = TextEditingController();
  TextEditingController avatarInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Column(children: [
        Center(
          child: Image.asset(
            'images/persons.jpg',
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        TextFormField(
          controller: nameInput,
          style: TextStyle(fontSize: 20, color: Colors.black),
          decoration: InputDecoration(
              focusColor: Colors.pink,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
              label: Text('Your Name')),
        ),
        TextFormField(
          controller: emailInput,
          style: TextStyle(fontSize: 20, color: Colors.black),
          decoration: InputDecoration(
              focusColor: Colors.pink,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
              label: Text('Your e-mail')),
        ),
        TextFormField(
          controller: phoneInput,
          style: TextStyle(fontSize: 20, color: Colors.black),
          decoration: InputDecoration(
              focusColor: Colors.pink,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
              label: Text('Your phone')),
        ),
        TextFormField(
          controller: avatarInput,
          style: TextStyle(fontSize: 20, color: Colors.black),
          decoration: InputDecoration(
              focusColor: Colors.pink,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
              label: Text('Your avatar')),
        ),
        ElevatedButton(
          onPressed: () {
            if (nameInput.text.isEmpty ||
                emailInput.text.isEmpty ||
                phoneInput.text.isEmpty ||
                avatarInput.text.isEmpty) {
              return;
            }
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Result(
                          savePerson: Person(
                              name: nameInput.text,
                              email: emailInput.text,
                              phone: phoneInput.text,
                              avatar: avatarInput.text),
                        )));
          },
          child: Text('Salvar'),
        )
      ]),
    );
  }
}
