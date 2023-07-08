import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpHelper {
  static late http.Response response;
  static late List<dynamic> data;

  static Future<void> getData({required String endpoint}) async {
    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/$endpoint');

    response = await http.get(url);
    data = jsonDecode(response.body);
    print(data);
  }
}
