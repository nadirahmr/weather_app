import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_service.dart';

import 'weather_detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  final WeatherService _weatherService = WeatherService();
  String _location = "New York";
  Map<String, dynamic>? _weatherData;

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }

  void _fetchWeatherData() async {
    try {
      final data = await _weatherService.fetchWeather(_location);
      setState(() {
        _weatherData = data;
      });
    } catch (e) {
      // Handle error
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter Location',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      _location = _controller.text;
                      _fetchWeatherData();
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            if (_weatherData != null) ...[
              Text(
                'Current Weather in $_location',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Temperature: ${_weatherData!['main']['temp']}°C',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Humidity: ${_weatherData!['main']['humidity']}%',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Wind Speed: ${_weatherData!['wind']['speed']} km/h',
                style: TextStyle(fontSize: 16),
              ),
            ],
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WeatherDetailsPage(weatherData: _weatherData),
                  ),
                );
              },
              child: Text('View Details'),
            ),
          ],
        ),
      ),
    );
  }
}
