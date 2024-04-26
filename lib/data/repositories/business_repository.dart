import 'dart:convert';
import 'package:http/http.dart' as http;

class BusinessRepository {
  static Future<List<dynamic>> fetchBusinesses() async {
    final response = await http.get(
      Uri.parse('https://api.yelp.com/v3/businesses/search?location=NYC'),
      headers: {
        'Authorization':
            'Bearer bza6Hp9uiEWv2F86OSEycfB9Sc7-7G9FfMZ1JgtQM3cqSpEnG6CsF_IzpEmouNAdfiXcvmL4DSbMqbsp6jmWpyKJ-DG7-FzN3hfqXxjvQ_jfgvZQWXr5yN9pdIrjZXYx', // Replace with your actual Yelp API key
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['businesses'];
    } else {
      throw Exception('Failed to load businesses');
    }
  }
}
