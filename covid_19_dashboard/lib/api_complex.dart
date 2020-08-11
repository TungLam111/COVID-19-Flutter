
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
class ApiProvider {

  Future<dynamic> get() async {
    var responseJson;
    var response = await http.get("https://pomber.github.io/covid19/timeseries.json");
    responseJson = _response(response);
    return responseJson;
  }

  dynamic _response(http.Response response) {
    if (response.statusCode == 200) 
      {
        var responseJson = json.decode(response.body);
        return responseJson;
  }
  }
}