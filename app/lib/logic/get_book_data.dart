import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> getBookImageUrl(String bookTitle) async {
  var response = await http.get(Uri.https(
      'app.rakuten.co.jp', '/services/api/BooksBook/Search/20170404', {
    'applicationId': '1075182123606422779',
    'format': 'json',
    'title': bookTitle
  }));

  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    return jsonResponse["Items"][0]["Item"]["largeImageUrl"];
  }
  return "";
}
