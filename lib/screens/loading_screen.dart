import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'ebef5a8eb94489f1bf659f71896acee3';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude = 0;
  double longitude = 0;

  void getLocationData() async {
    Location location = Location();

    //you can only wait on method that return future
    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    //getData();

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weaterData = await networkHelper.getData();
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
