import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ForecastList extends StatelessWidget {
  const ForecastList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
              ForecastItem(),
              ForecastItem(),
              ForecastItem(),
              ForecastItem(),
              ForecastItem(),
              ForecastItem(),
              /*  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ForecastItem(),
                  ForecastItem(),
                  ForecastItem(),
                  ForecastItem(),
                  ForecastItem(),
                  ForecastItem(),
                ],
              ), */
            ],
          ),
        ),
      ],
    );
  }
}

class ForecastItem extends StatelessWidget {
  const ForecastItem({
    super.key,
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
            color: Colors.blue.shade700,
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
                  'Lunes',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  '20 °C',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  '17 °C',
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
              'assets/lottie/tormenta.json',
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ],
    );
  }
}
