class ForecastDay {
  final DateTime date;
  final double maxtempC;
  final double mintempC;
  final double avgtempC;

  ForecastDay({
    required this.date,
    required this.maxtempC,
    required this.mintempC,
    required this.avgtempC,
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
