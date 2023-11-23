import 'package:clima/features/presentation/view_models/weather_view_model.dart';
import 'package:clima/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class ForecastList extends ConsumerWidget {
  const ForecastList({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final weatherViewModel = ref.watch(weatherNotifierProvider);

    if (weatherViewModel.forecast == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Column(
      children: [
        Expanded(
            child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: weatherViewModel.forecast!.forecastDays
                    .map(
                      (e) => ForecastItem(
                          condition: e.condition,
                          day: e.day.substring(0, 3),
                          tempMax: e.maxtempC,
                          tempMin: e.mintempC,
                          date: formateDate(e.date)),
                    )
                    .toList())),
      ],
    );
  }
}

class ForecastItem extends StatelessWidget {
  final String day;
  final double tempMax;
  final double tempMin;
  final String condition;
  final String date;

  const ForecastItem({
    super.key,
    required this.day,
    required this.tempMax,
    required this.tempMin,
    required this.condition,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(
            10,
            20,
            10,
            50,
          ),
          height: MediaQuery.of(context).size.height * 0.16,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: getBackgroundColorFromTemperature(tempMax),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              50,
              0,
              20,
              0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$day - $date',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  '$tempMax °C',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  '$tempMin °C',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -50,
          right: 20,
          child: Container(
            clipBehavior: Clip.none,
            alignment: Alignment.topRight,
            height: 200,
            child: Lottie.asset(
              getIconFromCondition(condition),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ],
    );
  }
}
