import 'package:atv_01_sqflite/models/contatos_model.dart';
import 'package:flutter/material.dart';

class ExtractArgumentsScreen extends StatelessWidget {
  const ExtractArgumentsScreen({super.key});
  static const routeName = '/extractArguments';
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Contatos;

    return Scaffold(
        appBar: AppBar(title: Text(args.name)),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const Icon(Icons.image_not_supported_outlined, size: 200),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    args.phoNumber,
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    args.email,
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
