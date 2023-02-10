import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart';

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

  void getData() async {
    Response response = await get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=ebef5a8eb94489f1bf659f71896acee3'),
    );

    print(response.statusCode);
  }

  @override
  void initState() {
    super.initState();
    //getLocation();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
