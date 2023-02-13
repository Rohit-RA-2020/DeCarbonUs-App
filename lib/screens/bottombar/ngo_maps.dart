import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class NgoMaps extends StatefulWidget {
  const NgoMaps({super.key});

  @override
  State<NgoMaps> createState() => _NgoMapsState();
}

class _NgoMapsState extends State<NgoMaps> {
  GoogleMapController? _controller;
  LatLng center = const LatLng(20.5937, 78.9629);
  final Set<Marker> _markers = {};
  Location currentLocation = Location();

  void getLocation() async {
    currentLocation.onLocationChanged.listen((LocationData loc) {
      _controller?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
        zoom: 12.0,
      )));
      setState(() {
        _markers.add(
          Marker(
            draggable: true,
            flat: true,
            infoWindow: const InfoWindow(title: 'Your Current Location'),
            markerId: const MarkerId('Home'),
            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
          ),
        );
      });
    });
  }

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GoogleMap(
          markers: _markers,
          onMapCreated: (GoogleMapController controller) {
            _controller = controller;
          },
          initialCameraPosition: CameraPosition(
            target: center,
            zoom: 5.0,
          ),
        ),
      ),
    );
  }
}
