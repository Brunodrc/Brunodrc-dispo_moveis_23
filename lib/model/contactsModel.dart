import 'dart:convert';

import 'package:mvc_app_1/model/personModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Contact {
  List<Person> contacts;

  Contact({required this.contacts});

  save() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', jsonEncode(contacts));
  }

  add(Person dados) {
    contacts.add(dados);
  }
}
