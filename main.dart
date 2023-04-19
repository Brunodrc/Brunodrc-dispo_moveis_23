import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Estudando tabBar',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const MyHomePage(title: 'Estudando tabBar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: Icon(Icons.airplanemode_active_sharp),
            ),
            Tab(
              icon: Icon(Icons.directions_car_filled_sharp),
            ),
            Tab(
              icon: Icon(Icons.directions_boat_sharp),
            ),
          ],
        ),
      ),
      body: Center(
        child: TabBarView(
          controller: _tabController,
          children: [
            Column(
              children: [
                Container(
                    height: 100, child: Icon(Icons.airplane_ticket_outlined)),
                Container(height: 100, child: Icon(Icons.airplanemode_off)),
              ],
            ),
            Column(
              children: [
                Container(
                  height: 100,
                  child: Image.network(
                      'https://img.freepik.com/psd-premium/carro-esporte-em-fundo-transparente-renderizacao-3d-ilustracao_494250-40917.jpg'),
                ),
                Container(
                  height: 100,
                  child: Image.network(
                      'https://www.pikpng.com/pngl/m/13-139120_ferrari-car-png-image-mejores-autos-del-mundo.png'),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: 100,
                  child: Image.network(
                      'https://www.vhv.rs/dpng/d/106-1063051_speedboat-hd-png-download.png'),
                ),
                Container(
                  height: 100,
                  child: Image.network(
                      'https://banner2.cleanpng.com/20180820/qu/kisspng-yacht-ship-boat-motul-watercraft-vivabtc-5b7b46eb34ed19.0537894115348057392168.jpg'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
