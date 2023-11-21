class Weather {
  final String cityName;
  final double temperatureCelsius;
  final String condition;
  final DateTime date;
  final bool isDay;

  Weather({
    required this.cityName,
    required this.temperatureCelsius,
    required this.condition,
    required this.date,
    required this.isDay,
  });
}
