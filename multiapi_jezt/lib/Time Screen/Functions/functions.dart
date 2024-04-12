import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map> fetchTime(String timezone) async {
  final response = await http.get(
    Uri.parse('https://worldtimeapi.org/api/timezone/$timezone'),
  );
  Map result = jsonDecode(response.body);
  return result;
}
