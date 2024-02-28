import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMaps extends StatefulWidget {
  const GoogleMaps({super.key, required this.position});
  final Position position;
  @override
  State<GoogleMaps> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        polylines: Set.from([
          Polyline(geodesic: true, polylineId: const PolylineId("1"), points: [LatLng(widget.position.latitude, widget.position.longitude), LatLng(widget.position.latitude + 5, widget.position.longitude + 5)])
        ]),
        markers: Set.from([
          Marker(
              infoWindow: InfoWindow(title: "Home"),
              markerId: const MarkerId("1"),
              position: LatLng(
                widget.position.latitude,
                widget.position.longitude,
              )),
          Marker(markerId: const MarkerId("2"), position: LatLng(widget.position.latitude + 5, widget.position.longitude + 5)),
        ]),
        initialCameraPosition: CameraPosition(target: LatLng(widget.position.latitude, widget.position.longitude), zoom: 14),
      ),
    );
  }
}
