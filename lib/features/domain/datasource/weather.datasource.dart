abstract class WeatherDataSource<ModelA, ModelB> {
  Future<ModelA> getWeatherByLocation(double lat, double loc);
  Future<ModelB> getForecastByLocation(double lat, double loc);
}
