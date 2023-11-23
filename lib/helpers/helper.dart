import 'package:flutter/material.dart';

const TEMP_LIMIT = 29;

enum Day {
  Lunes(1),
  Martes(2),
  Miercoles(3),
  Jueves(4),
  Viernes(5),
  Sabado(6),
  Domingo(7);

  final int value;
  const Day(this.value);
}

String getDayName(int day) {
  return Day.values.firstWhere((e) => e.value == day).toString().split('.')[1];
}

formateDate(DateTime date) {
  return '${date.day}/${date.month}';
}

getIconFromCondition(String condition) {
  final c = condition.toLowerCase();

  if (c.contains('sunny') || c.contains('clear')) {
    return 'assets/lottie/soleado.json';
  }

  if (c.contains('cloudy') ||
      c.contains('fog') ||
      c.contains('mist') ||
      c.contains('overcast')) {
    return 'assets/lottie/nublado.json';
  }

  if (c.contains('rain') ||
      c.contains('drizzle') ||
      c.contains('shower') ||
      c.contains('downpour') ||
      c.contains('rainy')) {
    return 'assets/lottie/lluvioso.json';
  }

  if (c.contains('thundery') ||
      c.contains('thunderstorm') ||
      c.contains('storm') ||
      c.contains('lightning') ||
      c.contains('thunder')) {
    return 'assets/lottie/tormenta.json';
  }

  return 'assets/lottie/soleado.json';
}

getBackgroundColorFromTemperature(double temp) {
  return temp > TEMP_LIMIT ? Colors.deepOrange.shade700 : Colors.blue.shade700;
}
