import 'package:clima/features/data/models/weather.model.dart';
import 'package:clima/features/data/models/weather_week.model.dart';
import 'package:http/http.dart' as http;
import 'package:clima/features/domain/datasource/weather.datasource.dart';

class _WeatherApi {
  static String baseUrl = 'http://api.weatherapi.com/v1';
  static String key = '2e63d6ffb1a94f42bd4204552232011';
  static String current = '/current.json';
  static String query = '?key=$key&q=';
  static String days = '&days=7';
  static String forecast = '/forecast.json';

  static getWeatherByLocationURL(double lat, double loc) {
    return '$baseUrl$current$query$lat,$loc&aqi=no';
  }

  static getWeatherForecastByLocationURL(double lat, double loc) {
    return '$baseUrl$forecast$query$lat,$loc$days&aqi=no';
  }
}

class WeatherDataSourceRemote
    implements WeatherDataSource<WeatherModel, WeatherWeekModel> {
  @override
  Future<WeatherModel> getWeatherByLocation(double lat, double loc) async {
    final url = _WeatherApi.getWeatherByLocationURL(lat, loc);
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) throw Exception('Failed to load weather');

    return WeatherModel.fromRawJson(response.body);
  }

  @override
  Future<WeatherWeekModel> getForecastByLocation(double lat, double loc) async {
    final url = _WeatherApi.getWeatherForecastByLocationURL(lat, loc);
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) throw Exception('Failed to load weather');

    return WeatherWeekModel.fromRawJson(response.body);
  }
}
