class ForecastDay {
  final String day;
  final String condition;
  final DateTime date;
  final double maxtempC;
  final double mintempC;
  final double avgtempC;

  ForecastDay({
    required this.date,
    required this.maxtempC,
    required this.mintempC,
    required this.avgtempC,
    required this.day,
    required this.condition,
  });
}

class Forecast {
  final String cityName;
  final List<ForecastDay> forecastDays;

  Forecast({
    required this.cityName,
    required this.forecastDays,
  });
}
