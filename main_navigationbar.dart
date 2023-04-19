import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => const MyHomePage(title: 'home'),
        '/page2': (context) => const Page2(),
        '/page3': (context) => const Page3(),
      },
      //Remover a faixa de debug
      debugShowCheckedModeBanner: false,
      title: 'Flutter Navigator',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MyHomePage(title: 'Estudando Navigation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  int _selectIndex = 0;

  int? _ontaped(int index) {
    setState(() {
      _selectIndex = index;
    });
    return _selectIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.pages_rounded), label: 'Page2'),
          BottomNavigationBarItem(
              icon: Icon(Icons.pageview_sharp), label: 'Page3'),
        ],
        currentIndex: _selectIndex,
        selectedItemColor: Colors.orange,
        onTap: (int index) {
          switch (_ontaped(index)) {
            case 0:
              Navigator.pushNamed(context, '/page2');
              break;
            case 1:
              Navigator.pushNamed(context, '/page3');
              break;
            default:
          }
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 2'),
      ),
      body: Center(
        child: BackButton(
          color: Colors.amber,
          onPressed: () => {Navigator.pop(context)},
        ),
      ),
    );
  }
}

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 3'),
      ),
      body: Center(
        child: BackButton(
          color: Colors.blueGrey,
          onPressed: () => {Navigator.pop(context)},
        ),
      ),
    );
  }
}
