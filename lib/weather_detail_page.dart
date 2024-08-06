import 'package:flutter/material.dart';

class WeatherDetailsPage extends StatelessWidget {
  final Map<String, dynamic>? weatherData;

  WeatherDetailsPage({required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (weatherData != null) ...[
              Text(
                'Weather Details for ${weatherData!['name']}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Temperature: ${weatherData!['main']['temp']}°C',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Humidity: ${weatherData!['main']['humidity']}%',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Wind Speed: ${weatherData!['wind']['speed']} km/h',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Weather: ${weatherData!['weather'][0]['description']}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
