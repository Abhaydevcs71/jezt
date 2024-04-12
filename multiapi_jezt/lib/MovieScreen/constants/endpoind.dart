class TmdbApi {
  static  String apiKey = '720a0f051c44c088c76cc14c73f1eadf';
  static  String baseUrl = 'https://api.themoviedb.org/3';
  static  String trendingEndpoint = '/trending/all/day';

  // Future<List<MovieData>> fetchTrendingMovies() async {
  //   final response = await http.get(Uri.parse('$_baseUrl$_trendingEndpoint?api_key=$_apiKey'));

  //   if (response.statusCode == 200) {
  //     final List<dynamic> jsonData = json.decode(response.body)['results'];
  //     return jsonData.map((movie) => MovieData.fromJson(movie)).toList();
  //   } else {
  //     throw Exception('Failed to load trending movies');
  //   }
  // }
}