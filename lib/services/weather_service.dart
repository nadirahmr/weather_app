import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = 'f54c68735515b5600dcbe5384deb8e58';
  final String apiUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<Map<String, dynamic>> fetchWeather(String location) async {
    final response = await http.get(
      Uri.parse('$apiUrl?q=$location&appid=$apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
