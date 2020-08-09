
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
class ApiProvider {
  final String _baseUrl = "https://pomber.github.io/covid19/timeseries.json";

  Future<dynamic> get() async {
    var responseJson;
    var response = await http.get(_baseUrl);
    responseJson = _response(response);
    return responseJson;
  }

  dynamic _response(http.Response response) {
    if (response.statusCode == 200) 
      {
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
  }
  }
}