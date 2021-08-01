import 'package:flutter/material.dart';
import 'package:clima_flutter/services/location.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

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

  //API calls
  void getData() async {
    Response response = await http.get(Uri.parse(
        'https://samples.openweathermap.org/data/2.5/forecast?id=524901&appid=b1b15e88fa797225412429c1c50c122a1'));
    print(response.statusCode);

    if (response.statusCode == 200) {
      String data = response.body;
    } else {
      print('The status code is : ' + response.statusCode.toString());
    }
  }

  //geolocation
  void getLocation() async {
    Location currentLocation = Location();
    await currentLocation.getCurrentLocation();
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
