import 'package:clima/core/base/adapter.dart';
import 'package:clima/features/data/models/weather.model.dart';
import 'package:clima/features/data/models/weather_week.model.dart';
import 'package:clima/features/domain/entites/forecast.entity.dart';
import 'package:clima/features/domain/entites/weather.entity.dart';
import 'package:clima/helpers/helper.dart';

class WeatherAdapter implements Adapter<WeatherModel, Weather> {
  @override
  Weather modelToEntity(WeatherModel model) {
    return Weather(
      cityName: model.location.name,
      temperatureCelsius: model.current.tempC.toDouble(),
      condition: model.current.condition.text,
      isDay: model.current.isDay == 1,
      date: DateTime.parse(
        model.current.lastUpdated,
      ),
    );
  }
}

class WeatherWeekAdapter implements Adapter<WeatherWeekModel, Forecast> {
  @override
  Forecast modelToEntity(WeatherWeekModel model) {
    return Forecast(
      cityName: model.location.name,
      forecastDays: model.forecast.forecastday
          .map(
            (e) => (ForecastDay(
                condition: e.day.condition.text,
                day: getDayName(e.date.weekday),
                avgtempC: e.day.avgtempC.toDouble(),
                maxtempC: e.day.maxtempC.toDouble(),
                mintempC: e.day.mintempC.toDouble(),
                date: e.date)),
          )
          .toList(),
    );
  }
}
