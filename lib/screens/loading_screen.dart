import 'dart:ui';

import 'package:clima_flutter/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima_flutter/services/location.dart';

const apiKey = 'fa8844c341b6c3f01a8d5721d8a03d2a';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  //API calls
  void getData() async {}

  //geolocation
  void getLocationData() async {
    Location currentLocation = Location();
    await currentLocation.getCurrentLocation();

    longitude = currentLocation.longitude;
    latitude = currentLocation.latitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    //await the network helper to get the weather data
    var weatherData = await networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            //Get the current location
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
