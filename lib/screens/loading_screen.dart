import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart';
import 'dart:convert';

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

    if (response.statusCode == 200) {
      String data = response.body;

      print(data);

      var temperature = jsonDecode(data)['main']['temp'];
      var id = jsonDecode(data)['weather'][0]['id'];
      var cityName = jsonDecode(data)['name'];

      print(temperature);
      print(id);
      print(cityName);
    } else {
      print(response.statusCode);
    }
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
