import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(-5.088629118458017, -42.81081277411446);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Set<Marker> _marcadores = {};

  carregarMarcadores() {
    Set<Marker> marcadoresLocal = {};
    Marker marcadorIfpi = Marker(
      markerId: MarkerId('IFPI'),
      position: LatLng(-5.088629118458017, -42.81081277411446),
    );
    Marker marcadorIfpiSul = Marker(
      markerId: MarkerId('IFPI-Sul'),
      position: LatLng(-5.101723, -42.813114),
    );
    marcadoresLocal.add(marcadorIfpi);
    marcadoresLocal.add(marcadorIfpiSul);
    setState(() {
      _marcadores = marcadoresLocal;
    });
  }

  void initState() {
    super.initState();
    carregarMarcadores();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Função para voltar à página anterior
            },
          ),
          title: Center(child: Text("Atividade mapa")),
          backgroundColor: Colors.cyan[600],
        ),
        body: GoogleMap(
          myLocationEnabled: true,
          mapType: MapType.normal,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 17,
          ),
          markers: _marcadores,
        ),
      ),
    );
  }
}
