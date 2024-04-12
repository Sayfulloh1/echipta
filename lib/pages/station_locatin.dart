import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StationLocation extends StatefulWidget {
  final double latitude;
  final double longitude;

  const StationLocation({Key? key, required this.latitude, required this.longitude}) : super(key: key);

  @override
  State<StationLocation> createState() => _StationLocationState();
}

class _StationLocationState extends State<StationLocation> {
  CameraPosition? _initialCameraPosition;
  @override
  void initState() {
    _initialCameraPosition = CameraPosition(
      target: LatLng(widget.latitude, widget.longitude),
      zoom: 15.0, // Adjust zoom level as needed
    );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Place on Map')),
      body: Container(
        width: 500,
        height: 300,
        color: Colors.green,
        child: GoogleMap(
          initialCameraPosition: _initialCameraPosition!,
          mapType: MapType.normal,
          markers: {
            Marker(
              markerId: MarkerId('place_marker'),
              position: LatLng(widget.latitude, widget.longitude),
            ),
          },
        ),
      ),
    );
  }
}
