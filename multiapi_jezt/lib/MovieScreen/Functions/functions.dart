import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:multiapi_jetz/MovieScreen/constants/endpoind.dart';

Future<List<Map<String, dynamic>>> fetchMovie() async {
  final response = await http.get(Uri.parse('https://api.themoviedb.org/3/trending/all/day?api_key=${TmdbApi.apiKey}'));
  if (response.statusCode == 200) {
    Map<String, dynamic> result = jsonDecode(response.body);
    List<dynamic> movies = result['results'];
    return movies.cast<Map<String, dynamic>>();
  } else {
    throw Exception('Failed to load movies');
  }
}
