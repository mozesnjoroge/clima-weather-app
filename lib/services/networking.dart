import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper {
  String url;
  NetworkHelper(this.url);

  Future getData() async {
    Response response = await http.get(Uri.parse(url));
    print(response.statusCode);

    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      return jsonDecode(data);
    } else {
      String data = response.body;
      print(data);
      print('The status code is : ' + response.statusCode.toString());
    }
  }
}
