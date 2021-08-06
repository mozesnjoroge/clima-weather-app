import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'package:clima_flutter/screens/loading_screen.dart';

class NetworkHelper {
  NetworkHelper(this.url);
  String url;

  Future getData() async {
    Response response = await http.get(Uri.parse(url));
    print(response.statusCode);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print('The status code is : ' + response.statusCode.toString());
    }
  }
}
