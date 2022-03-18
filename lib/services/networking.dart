import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkingHelper{
  final uri;
  NetworkingHelper(this.uri);

  Future getData() async {
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String data = response.body;
      return  jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}