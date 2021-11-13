import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=3a21d3e9b15195b6bb74d2e5b3e238d6'));
    if (response.statusCode == 200) {
      String data = response.body;
    } else {

    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
