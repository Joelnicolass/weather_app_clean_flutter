import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ForecastList extends StatelessWidget {
  const ForecastList({
    super.key,
    required double scrollPosition,
  }) : _scrollPosition = scrollPosition;

  final double _scrollPosition;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /*  _scrollPosition > MediaQuery.of(context).size.height * 0.35
            ? SizedBox(
                height:
                    _scrollPosition - MediaQuery.of(context).size.height * 0.35,
              )
            : Container(), */
        Expanded(
          child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            //scrollDirection: Axis.horizontal,
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
    return Container(
      margin: const EdgeInsets.all(10),
      height: 150,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Lunes',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 100,
            child: Lottie.asset(
              'assets/lottie/soleado.json',
              fit: BoxFit.fitWidth,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '20 °C',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '17 °C',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
