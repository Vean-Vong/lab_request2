import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/request_model.dart';

class RequestService {
  Future<List<Request>> fetchRequests() async {
    var url = Uri.parse('https://borinmorm21.github.io/dummy-data-lab-request/data.json');
    var response = await http.get(url);
    print(response.body);


    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      // Parse the JSON data
      List<Request> requests = (data['requests'] as List)
          .map((json) => Request.fromJson(json))
          .toList();

      return requests;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
