import 'package:flutter/material.dart';
import 'package:food_application/consonants/Const.dart';
import 'package:food_application/screens/Views/Categories/TrackOrderPage.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'dart:async';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationpageState();
}

class _LocationpageState extends State<LocationPage> {
  final Completer<GoogleMapController> _mapController = Completer();
  LatLng? _currentPosition;
  Map<PolylineId, Polyline> polylines = {};
  final Location _locationController = Location();

  static const LatLng _kGooglePlex = LatLng(37.422, -122.084);
  static const LatLng _kApplePark = LatLng(37.3349, -122.009);

  @override
  void initState() {
    super.initState();
    getLocationUpdate();
    getPolylinePoints().then((points) {
      generatePolylineFromPoints(points);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF180649),
              Color(0xFF3910AA),
              Color(0xFF240970),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Location Page',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    suffixIcon: Icon(Icons.qr_code),
                    hintText: 'Find your Location',
                    hintStyle: TextStyle(color: Colors.white70),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Color(0xFF120536),
                    filled: true,
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20),
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _currentPosition == null
                      ? Center(child: CircularProgressIndicator())
                      : GoogleMap(
                          onMapCreated: (GoogleMapController controller) {
                            _mapController.complete(controller);
                          },
                          initialCameraPosition:
                              CameraPosition(target: _kGooglePlex, zoom: 14),
                          markers: {
                            Marker(
                              markerId: MarkerId('Current Location'),
                              icon: BitmapDescriptor.defaultMarker,
                              position: _currentPosition!,
                            ),
                            Marker(
                              markerId: MarkerId('Google Plex'),
                              icon: BitmapDescriptor.defaultMarker,
                              position: _kGooglePlex,
                            ),
                            Marker(
                              markerId: MarkerId('Apple Park'),
                              icon: BitmapDescriptor.defaultMarker,
                              position: _kApplePark,
                            ),
                          },
                          polylines: Set<Polyline>.of(polylines.values),
                        ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Color(0xFF120536),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _currentPosition == null
                      ? Text(
                          'Fetching location...',
                          style: TextStyle(color: Colors.white),
                        )
                      : Text(
                          'Current Location: (${_currentPosition!.latitude}, ${_currentPosition!.longitude})',
                          style: TextStyle(color: Colors.white),
                        ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF03237C),
                      padding: EdgeInsets.symmetric(horizontal: 90, vertical: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    Get.to(TrackOrderPage());
                  },
                  child: Text(
                    'Find your Location',
                    style: GoogleFonts.bonaNova(
                      textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getLocationUpdate() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
      if (!_serviceEnabled) {
        throw 'Location services are disabled.';
      }
    }
    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        throw 'Location permission denied.';
      }
    }

    _locationController.onLocationChanged.listen((LocationData currentLocation) {
      if (currentLocation.latitude != null && currentLocation.longitude != null) {
        setState(() {
          _currentPosition = LatLng(currentLocation.latitude!, currentLocation.longitude!);
          _cameraToPosition(_currentPosition!);
        });
      }
    });
  }

  Future<List<LatLng>> getPolylinePoints() async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleApiKey: GOOGLE_MAPS_API_KEY,
        request: PolylineRequest(
            origin: PointLatLng(_kGooglePlex.latitude, _kGooglePlex.longitude),
            destination: PointLatLng(_kApplePark.latitude, _kApplePark.longitude),
            mode: TravelMode.driving));
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      throw 'No polyline points found.';
    }
    return polylineCoordinates;
  }

  Future<void> _cameraToPosition(LatLng latLng) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newCameraPosition = CameraPosition(target: latLng, zoom: 13);
    await controller.animateCamera(CameraUpdate.newCameraPosition(_newCameraPosition));
  }

  void generatePolylineFromPoints(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.blue,
      points: polylineCoordinates,
      width: 8,
    );
    setState(() {
      polylines[id] = polyline;
    });
  }
}