import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude = 0;
  double longitude = 0;

  void getLocation() async {
    Location location = Location();
//you can only wait on method that return future
    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    print(latitude.toString() + '       ' + longitude.toString());
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
