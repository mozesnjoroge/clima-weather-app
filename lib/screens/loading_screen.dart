import 'package:clima_flutter/screens/location_screen.dart';
import 'package:clima_flutter/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima_flutter/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = 'fa8844c341b6c3f01a8d5721d8a03d2a';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  //geolocation
  void getLocationData() async {
    Location currentLocation = Location();
    await currentLocation.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
'https://api.openweathermap.org/data/2.5/weather?lat={currentLocation.latitude}&lon={currentLocation.longitude}&appid=$apiKey&units=metric');
    //await the network helper to get the weather data
    var weatherData = await networkHelper.getData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(locationWeather: weatherData);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingFour(
          color: Colors.blue,
          size: 150.0,
        ),
      ),
    );
  }
}
