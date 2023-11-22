import 'package:flutter/material.dart';

class CityAndTemperature extends StatelessWidget {
  final String cityName;
  final double temperatureCelsius;

  const CityAndTemperature({
    required this.cityName,
    required this.temperatureCelsius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          cityName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        Text(
          '${temperatureCelsius} °C',
          style: TextStyle(
            fontSize: 80,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
