import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {

  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    //I add a .timeout function to limit api call.
    http.Response response = await http.get(url).timeout(Duration(seconds: 3));

    //Ensuring we get the correct status code.
    if (response.statusCode == 200) {
      String data = response.body;
      //return with parsing data...
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}