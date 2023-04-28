import 'package:atv_01_sqflite/view/Allcontactspage.dart';
import 'package:atv_01_sqflite/view/homepage.dart';
import 'package:atv_01_sqflite/widgets/extractargs.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Homepage(),
        '/listallcontacts': (context) => const Allcontactspage(),
        ExtractArgumentsScreen.routeName: (context) =>
            const ExtractArgumentsScreen(),
      },
      theme: ThemeData(primarySwatch: Colors.cyan),
    );
  }
}
