import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NgoMaps extends StatefulWidget {
  const NgoMaps({super.key});

  @override
  State<NgoMaps> createState() => _NgoMapsState();
}

class _NgoMapsState extends State<NgoMaps> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(21.1458, 79.0882);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 12.0,
          ),
        ),
      ),
    );
  }
}
