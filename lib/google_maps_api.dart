import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class GoogleMapsView extends StatefulWidget {
  const GoogleMapsView({super.key});

  @override
  State<GoogleMapsView> createState() {
    return GoogleMapsState();
  }
}

class GoogleMapsState extends State<GoogleMapsView> {

  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 22.151926040649414);

  final List<Marker> _markers = <Marker>[
    Marker(
        markerId: const MarkerId("lake"),
        position: const LatLng(37.43296265331129, -122.08832357078792),
        infoWindow: const InfoWindow(title: "Lake"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: Set<Marker>.of(_markers),
        mapType: MapType.satellite,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) => _controller.complete(controller),
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton.extended(
              onPressed: () async =>
                  getUserCurrentLocation().then((value) async {
                    print("${value.latitude} ${value.longitude}");
                    _markers.add(
                        Marker(
                            markerId: const MarkerId('home'),
                            position: LatLng(value.latitude, value.longitude),
                            infoWindow: const InfoWindow(title: 'My Current Location')
                        )
                    );
                    CameraPosition cameraPosition = CameraPosition(
                      target: LatLng(value.latitude, value.longitude),
                      zoom: 18,
                    );

                    final GoogleMapController controller = await _controller.future;
                    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
                    setState(() {
                    });
                  }),
              icon: const Icon(Icons.home), label: const Text(''),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton.extended(
              onPressed: _goToTheLake,
              label: const Text(''),
              icon: const Icon(Icons.directions_boat),
            ),
          )
        ],
      )
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  // created method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission().then((value){
    }).onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR$error");
    });
    return await Geolocator.getCurrentPosition();
  }
}